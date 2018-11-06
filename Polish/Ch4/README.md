
# Struktura programu w C

## Słowa kluczowe C11

```
auto      extern   short     while
break     float    signed    _Alignas
case      for      sizeof    _Alignof
char      goto     static    _Atomic
const     if       struct    _Bool
continue  inline   switch    _Complex
default   int 	   typedef   _Generic
do        long     union     _Imaginary
double 	  register unsigned  _Noreturn
else      restrict void      _Static_assert
enum      return   volatile  _Thread_local
```

Nie musisz znać wszystkich z wymienionych powyżej słów kluczowych. Możesz odwołać się do tej tabeli, jeśli tylko będzie Ci potrzebna.

## Biblioteki

Biblioteka to zbiór narzędzi, które zostały wydzielone po to, aby dało się z nich korzystać w wielu programach. Ułatwiają one programowanie poprzez rozszerzanie aplikacji. Każda biblioteka posiada swoje pliki nagłówkowe, które zawierają deklaracje funkcji oraz często zawarte są w nich komentarze, jak używać danej funkcji.

Biblioteki dzielimy według sposobu wykorzystania, autora i rozszerzenia.

Według wykorzystania biblioteki mogą być statyczne, (Windows: .lib; Unix .a, można zaliczyć do tego pliki obiektowe odpowiednio .obj i .o) lub dynamiczne (Unix: .so, ścieżki do plików w /etc/ld.so.conf oraz $LD_LIBRARY_PATH; Windows: .dll)

Według autora biblioteki mogą być standardowe (dołączane do 99% kopii kompilatora i systemu operacyjnego) lub niestandardowe (dołączane rzadko lub często; mogą być specyficzne dla platformy, w części przypadków są nieprzenośne).

I finalnie, według rozszerzenia (dla Uniksopodobnych):
 * `.a`   - biblioteka statyczna;
 * `.bin` - plik binarny, często plik wykonywalny bez widocznego nagłówka formatu pliku wykonywalnego.
 * `.fw`  - pliki skompilowanego firmware
 * `.ko`  - moduły jądra
 * `.o`   - pliki obiektowe
 * `.so`  - dynamicznie linkowane biblioteki dzielone
 
GCC najczęściej szuka bibliotek na komputerach pod kontrolą systemu unikspodobnego w:
 * /usr/local i target/include
 * /usr/include

## Budowa pliku nagłówkowego biblioteki

Najczęściej pliki nagłówkowe mają następującą postać:

```
#ifndef _FILE_H
#define _FILE_H

/* ... */

#endif
```

Takie rozwiązanie zapobiega dołączaniu pliku wielokrotnie w jednej jednostce. Jeśli teoretycznie nagłówki dołączałyby się rekursywnie, to zapobiega niezliczonym błędom. W plikach nagłówkowych często umieszcza się definicje typów, z których korzysta biblioteka, makra i deklaracje funkcji.

## Tworzenie prostej biblioteki

Zakładając że biblioteka będzie posiadać wyłącznie jedną funkcję, możemy stworzyć ją w następujący sposób:

```
#ifndef _NAZWA_AUTOR_H
#define _NAZWA_AUTOR_H

#include <stdio.h>

void hello(void) {
    puts("Hello World!");
}

#endif

```

Należy pamiętać, o podaniu void w liście argumentów funkcji nie przyjmujących argumentów. W prototypie nie ma informacji na temat tego jakie argumenty funkcja przyjmuje, jeśli nawiasy są puste.

Plik ten należy zapisać jako "hello.h".

UWAGA: Jeśli spróbujesz dołączyć ten plik w dwóch oddzielnych plikach i połączyć, otrzymasz błąd kompilacji. Dzieje się tak, ponieważ wewnątrz jednej aplikacji znajduje się kilka funkcji nazwanych tak samo (`hello` i `hello`). 

Praktyczne użycie:

```
#include "hello.h"
 
int main(void) {
   hello();
}
```

Zakładając że nazwa powyższego pliku to `main.c`, komenda kompilacji wygląda "normalnie":

```
gcc main.c -o main
```

```
./main
```

=>

```
Hello World!
```

Zalecam Ci, aby implementacje funkcji w plikach nagłówkowych w dużych projektach (czego osobiście nie zalecam) były statyczne. Pomoże zapobiec to konfliktom w czasie linkowania. Poprawiona wersja biblioteki:

```
#ifndef _NAZWA_AUTOR_H
#define _NAZWA_AUTOR_H

#include <stdio.h>

static void hello(void) {
    puts("Hello World!");
}

#endif

```

Preprocesor to program analizujący kod źródłowy w poszukiwaniu dyrektyw preprocesora. Na podstawie tych instrukcji generuje on kod w "czystym" języku C, który następnie jest kompilowany przez kompilator. Ponieważ za pomocą preprocesora można sterować kompilatorem daje on możliwości, które nie były dotąd znane w innych językach programowania.

W języku C wszystkie linie zaczynające się od symbolu "#" są dyrektywami preprocesora. Nie są elementami języka C i nie podlegają bezpośrednio procesowi kompilacji.

Preprocesory są najczęściej wbudowane w kompilator. Istnieją również samodzielne preprocesory (GNU M4, Cog, czy chociażby mój PCP). Aby zobaczyć kod wytworzony przez preprocesor użyj przełącznika `-E`.

```
gcc test.c -E -o test.i
```

Ten plik może być dość duży, więc nie będę wstawiał tutaj mojego wyniku wykonywania tego polecenia.

Dyrektywy preprocesora to wyrażenia rozpoczynające się "#". Dyrektywa kończy się końcem linii, jednak można przenieść ją do następnej linii znakiem "\".

```
#define DODAJ(a,b) \
  a+b
```

### `#include`

To jedna z częściej wykorzystywanych dyrektyw, którą już znasz. Sprawia, że plik podany między nawiasami kwadratowymi (jeśłi jest nagłówkiem z include path) lub cudzysłowiem (jeśli znajduje się w lokalizacji relatywnej do pliku .c/.h) zostaje dopisany z całą swoją zawartością w miejsce dyrektywy.

### `#define`

Ta dyrektywa pozwala na zdefiniowanie stałej, makra, słowa kluczowego i funkcji. Przykład:

```
#define LICZBA 42
#include <stdio.h>

int main(void) {
    return LICZBA;
}
```

Zwróci 42. Można również definiować stałą jako "nic":

```
#define LICZBA
#include <stdio.h>

int main(void) {
    return LICZBA-1;
}
```

Zwróci -1. Przykładem makra może być:

```
#define SUMA(x,y) ((x)+(y))
```

Należy pamiętać, że parametry najbezpieczniej jest podawać w nawiasie, a całe makro również wrzucić w nawias. Zapobiegnie to powstaniu różnych dziwnych sytuacji. Przykładem takiej "niespodzianki" jest klasyk:

```
#include <stdio.h>

#define SIX 1+5
#define NINE 8+1

int main(void) {
    printf("%d * %d = %d\n", SIX, NINE, SIX * NINE);
    return 0;

}
```

... który na STDOUT wypisze `6 * 9 = 42` zamiast `6 * 9 = 54`. Przyjrzyjmy się programowi dokładniej. Jeśli odetniemy z wyjścia nagłówek stdio i wszystkie jego zależności, jak i makra wstawiane przez preprocesor, kod będzie wyglądał tak:

```
int main(void) {
    printf("%d * %d = %d", 1+5, 8+1, 1+5*8+1);
    return 0;
}
```

Uprośćmy to lekko:

```
int main(void) {
    printf("%d * %d = %d", 6, 9, 1+5*8+1);
    return 0;
}
```

Widać że pierwsze dwie liczby się zgadzają, ale potem mamy zaskoczenie: `1+5*8+1`. Znając kolejność wykonywania działań, jest to `1+40+1`, czyli `42`. Jak temu zapobiec? Bardzo prosto. Spójrzmy jeszcze raz na stary program:

```
#include <stdio.h>

#define SIX (1+5)
#define NINE (8+1)

int main(void) {
    printf("%d * %d = %d\n", SIX, NINE, SIX * NINE);
    return 0;

}
```

Teraz na STDOUT zostanie wypisany prawidłowy wynik. Przykład ten pochodzi z książki K&R i ma demonstrować niewłaściwe użycie preprocesora.

### `#undef`

Ta dyrektywa odwraca działanie `#define`. Przykład:

```
#define SOMETHING 3
const int sth = SOMETHING; /* sth = 3 */
#undef SOMETHING
const int sth2 = SOMETHING; /* error */
```

### `#if #else #elif #endif` - kompilacja warunkowa

Powyższe dyrektywy procesora uzależniają przebieg późniejszej kompilacji od stałych znanych w czasie procesu wstępnego przetwarzania kodu źródłowego:

 * `#if` sprawia że blok aż do `#endif`/`#else`/`#elif`, jeśli nie jest prawdziwy, zostaje wycięty z wynikowego kodu źródłowego, co sprawia że nie jest uwzględniony w pliku binarnym.
 * `#else` spowoduje skompilowanie kodu jeżeli warunek odpowiadający `#if` jest fałszywy, aż do napotkania `#elif`, `#endif` lub `#if`.
 * `#elif` to połączenie `#if` i `#else`.
 * `#endif` zamyka blok otworzony przez `#if`, `#else` lub `#elif`.

Przykład:

```
#define OS 0 /* 0-Windows, 1-Linux, 2-MacOS */

#if OS == WINDOWS
    printf ("You are using Windows");
#elif OS == LINUX
    printf ("You are using Linux");
#else
    printf ("Are you using MacOS?");
#endif
```

### `#ifdef #ifndef`

Dyrektywy preprocesora `#ifdef #ifndef` działają podobnie, ale tylko sprawdzają czy dany symbol został wcześniej zdefiniowany lub nie, z jakąkolwiek wartością. Przejdźmy od razu do przykładu, przytaczając sobie plik nagłówkowy twojej pierwszej biblioteki:

```
#ifndef _NAZWA_AUTOR_H
#define _NAZWA_AUTOR_H

/* ... */

#endif
```

Widać tutaj dyrektywę `#ifndef` - kod między tą dyrektywą a `#endif` będzie kompilowany wyłącznie jeśli `_NAZWA_AUTOR_H` nie zostało wcześniej zdefiniowane. Następnie definiujemy `#define _NAZWA_AUTOR_H`. Czemu?

Taki zabieg pozwala ominąć różne nieprzyjemne komplikacje wynikające z podwójnego dołączenia pliku. Możemy np dwukrotnie zadeklarować funkcję (wtedy nastąpi konflikt dwóch wcześniejszych zadeklarowań).

### `#error`

Dyrektywa `#error` wywołuje błąd kompilacji, jeśli tylko preprocesor ją napotka. Dziwne, nielogiczne? Spójrz na prosty przykład. Piszesz bibliotekę która może być kompilowana tylko pod systemami UNIX-like (bo np. korzysta z pliku nagłówkowego <unistd.h> zawierającego część funkcji z POSIXa, którego na próżno szukać na Windows-like). Teraz użytkownik chce to skompilować używając systemu Windows. Co się dzieje? Tona błędów które prawdopodobnie nic nie znaczą dla kompilującego. I co teraz? Kompilujący może ticketować issue z projektem (buuuu, nie buduje się). Aby tego uniknąć użyj `#error`.

```
#if defined (__unix__) || (defined (__APPLE__) && defined (__MACH__))
    /* Ok */
    #include <unistd.h>
    /* ... */
#else
    #error "This library can't be built and ran under non-POSIX operating system."
#endif
```

### `#warning`

Dyrektywa `#warning` ma podobne zastosowanie do `#error`, ale wywołuje ostrzeżenie a nie błąd krytyczny.

### `#line`

Dyrektywa ta powoduje wyzerowanie licznika linii. Osobiście nie widzę sensu w używaniu tej dyrektywy manualnie, w kodzie który nie był przetwarzany wstępnie przez inne programy.

```
/* aaa */
#line
/* bbb */
#line 1453
/* ccc */
```

### `#pragma`

Dyrektywa `#pragma` służy m.in. do tworzenia wątków w OpenMP. Z język aangielskiego "Pragmatic Information". Jest też wykorzystywana w kompilatorach Microsoftu m.in., dla zastępstwa dla include guards (konstrukcji wspomnianej przy `#ifndef`; `#pragma once`, jednak nie zalecam używania tej dyrektywy) 

### `## #`

Dość ciekawe możliwości ma w makrach "operator" #. Zamienia on stojący za nim identyfikator na napis. Przykład jest bardzo prosty:

```
#define tostring(identifier) printf("%s = %i\n", #x, x)

/* ... */

int x = 23;
tostring(x);
```

... i wyjście:

```
x = 23
```

"Operator" `##` jest lekko mniej użyteczny w bardziej casualowych programach. `##` łączy dwa identyfikatory w jeden. Przykład:

```

#include <stdio.h>

#define decl(x) int x##_variable
#define echo(y) printf("%s=%i", #y, y)

int main() {
    decl(abc) = 2;
    echo(abc_variable);
    return 0;
}

```

### Makra

Preprocesor C umożliwia tworzenie makr, czyli "funkcji", które są wstawiane do kodu.
Makra deklaruje się za pomocą dyrektywy `#define`, jak na poniższym schemacie:

```
#define macro(arg1, arg2, ...) (expr)
```

W momencie wystąpienia `macro` w kodzie źródłowym, preprocesor automatycznie zamieni makro na wyrażenie lub instrukcje. Ponieważ makro sprowadza się do prostego zastąpienia przez preprocesor wywołania makra przez jego tekst, jest bardzo podatne na trudne do zlokalizowania błędy. Makra są szybsze (nie następuje wywołanie funkcji, które zawsze zajmuje trochę czasu głównie na x86), ale też mniej elastyczne i miejscowo wydajne niż funkcje. 

A w praktyce? Przykład:

```
#define square(x) ((x)*(x))
```

Preprocesor w miejsce wyrażenia `square(2)` wstawi `((2)*(2))` => `4`. A co jakby napisać `square("2")`? Preprocesor po prostu wstawi napis do kodu, co da wyrażenie `(("2")*("2"))`, które jest nieprawidłowe (chyba że mówimy o języku JavaScript, gdzie wszystko można). Kompilator zgłosi błąd, ale jego szukanie może sprawić drobną trudność. Widać, że bezpieczniejsze jest użycie funkcji, które dają możliwość specyfikowania sztywnej i niezmienialnej typów argumentów. 

Mówiąc o makrach często mówimy o tzw. "Side effects". "Side effects" to rzeczy które mogą się wydarzyć nieoczekiwane podczas ewaluacji makra. Bierzemy na tapetę przykład:

```
int x = 2;
int y = square(++x);
```

Czy `y == 4`? Nie. Jeśli wiesz czemu, możesz spokojnie pominąć poniższe wyjaśnienie. Otóż preprocesor zamienia `square(++x)` na `((++x)*(++x))`, czyli po wyrzuceniu nawiasów `++x * ++x`. Jak widać, mamy do czynienia z podwójną inkrementacją, zamiast pojedynczej. Jak temu zaradzić? Użyć funkcji.

Poniższe makra również są błędne:

```
#define add(a, b) a + b
#define mul(a, b) a * b
```

Odnalezienie "słabych punktów" poniższych makr możesz potraktować jako ćwiczenie, w momencie pisania widzę tu conajmniej dwa możliwe sposoby wykorzystania braku nawiasów i inkrementacji.

### Predefiniowane makra

W języku wprowadzono pokaźną liczbe predefiniowanych makr, które mają ułatwić życie programiście. Oto lista najważniejszych:

 * `__FILE__` - nazwa aktualnie przetwarzanego pliku
 * `__LINE__` - numer linii
 * `__DATE__` - data kompilacji
 * `__TIME__` - godzina kompilacji
 * `__STDC__` - w kompilatorach zgodnych z ANSI przyjmuje wartość 1
 * `__STDC_VERSION__` - zależnie od poziomu zgodności kompilatora ze standardami, makro przyjmuje głównie następujące wartości:
   * standard z 1989: makro nie jest zdefiniowane,
   * standard z 1994: makro ma wartość 199409L,
   * standard z 1999: makro ma wartość 199901L.

## Biblioteka standardowa

W jakimś z początkowych rozdziałów tej książki napisane jest, że czysty rasowo język C bez biblioteki standardowej nie może zbyt wiele. Tak naprawdę, to język C sam w sobie praktycznie nie ma mechanizmów do obsługi np. i/o (co powinieneś już pamiętać, drogi Czytelniku). Dlatego też większość systemów operacyjnych posiada tzw. bibliotekę standardową zwaną też biblioteką języka C (libc). To właśnie w niej zawarte są podstawowe funkcjonalności, dzięki którym program może, na przykład, wypisać coś na ekran.

Jak biblioteka standardowa implementuje te funkcje, skoro sam język C tego nie potrafi? Odpowiedź jest prosta - biblioteka standardowa nie jest napisana wyłącznie w C. Ponieważ C jest kompilowany do kodu maszynowego, nie ma przeszkód, żeby połączyć go z językiem niskiego poziomu, jakim jest Assembly, ale o nim później. Dlatego biblioteka C udostępnia gotowe funkcje w języku C, a z drugiej za pomocą niskopoziomowych mechanizmów komunikuje się z systemem operacyjnym, który wykonuje odpowiednie czynności.

Najpopularniejsze wersje libc to m.in. `glibc` - GNU libc, `uClibc` - implementacja dla systemów embedded, `Diet libc` - odchudzona wersja biblioteki standardowej (która i tak nie potrzebuje odchudzania, tylko dopasania)

Jak sprawdzić której wersji używa twój system (zakładając że jest unixopodobny)?

```
ldd --version
# albo
getconf GNU_LIBC_VERSION
```

Gdzie są funkcje z biblioteki standardowej?

Pisząc program w języku C używa się różnego rodzaju funkcji, takich jak na przykład `printf`. Twój pierwszy program zaczynał się od takiej linijki:

```
#include <stdio.h>
```

Dyrektywa ta mówi preprocesorowi: "tu wstaw zawartość stdio.h". Nawiasy "<" i ">" oznaczają, że plik stdio.h znajduje się w standardowym katalogu z plikami nagłówkowymi. Wszystkie pliki z rozszerzeniem `.h` są właśnie plikami nagłówkowymi. Wracając teraz do tematu biblioteki standardowej...

Każdy system operacyjny ma za zadanie udostępniać pewne funkcje na rzecz programów. Wszystkie te funkcje zawarte są właśnie w bibliotece standardowej. W systemach z rodziny UNIX nazywa się ją, jak wcześniej wspominałem, `libc`. Tam właśnie są zaimplementowane funkcje typu `puts()` albo `scanf()`.

Oprócz podstawowych funkcji wejścia-wyjścia, biblioteka standardowa udostępnia też możliwość między innymi komunikację przez sieć, wykonywanie funkcji matematycznych, itd.

| Nazwa nagłówka | Standard | Co zawiera |
|----------------|----------|------------|
| <assert.h>     | C89   | makro assert |
| <complex.h> | C99 | funkcje do zarządzania liczbami zespolonymi |
| <ctype.h> | C89 | funkcje służące do zarządzania głównie znakami (`isspace`, `tolower`, ...) |
| <errno.h> | C89 | lista błędów jakie teoretycznie mogą wystąpić podczas wykonywania funkcji z biblioteki standardowej |
| <fenv.h> | C99 | funkcje służące do zarządzania środowiskiem liczb zmiennoprzecinkowych |
| <float.h> | C89 | implementation-specific code dotyczące biblioteki liczb zmiennoprzecinkowych |
| <inttypes.h> | C99 | rozmiar typów pochodnych od `int` (np. `double`) |
| <iso646.h> | C99 | m.in. aliasy dla operatorów |
| <limits.h> |	C89 | stałe dotyczące zmiennych platform-specific typu int |
| <locale.h> |	C89 | funkcje dotyczące internacjonalizacji |
| <math.h> | C89 | funkcje matematyczne |
| <setjmp.h> | C89 | setjmp i longjmp, używane do nielokalnych skoków |
| <signal.h> | C89 | obsługa sygnałów |
| <stdalign.h> | C11 | ustawianie i sprawdzanie wyrównania obiektów |
| <stdarg.h> | C89 | obsługa zmiennej liczby argumentów do funkcji |
| <stdatomic.h> | C11 | obsługa operacji atomowych między wątkami |
| <stdbool.h> |	C99	| typ danych boolean |
| <stddef.h> |	C89 | użyteczne typy i makra |
| <stdint.h> |	C99 | standaryzuje rozmiary liczb całkowitych (np. `int8_t` => `char`) |
| <stdio.h> | C89 | standardowe funkcje wejścia i wyjścia |
| <stdlib.h> |	C89 | funkcje zezwalające np. na konwersję typów danych, generację liczb pseudolosowych, alokację pamięci, zarządzanie procesem |
| <stdnoreturn.h> | C11 | konstrukcje zezwalające na tworzenie funkcji które nie zwracają kontroli wywoływaczowi |
| <string.h> | C89 | funkcje do manipulacji ciągami |
| <tgmath.h> | C99 | type-generic funkcje matematyczne |
| <threads.h> |	C11	| zestaw narzędzi do pracy z wielowątkowością |
| <time.h> 	|	C89 | zestaw narzędzi do pracy z czasem |
| <uchar.h> | 	C11 | funkcje do zarządzania tzw. `wide-characters` |
| <wchar.h> |	C99 | funkcje do zarządzania `wide` ciągami znaków |
| <wctype.h> |	C99 | funkcje do klasyfikowania `wide-characters` zależnie od ich typów oraz konwertowania ich na wielkie lub małe litery |

**[Powrót do spisu treści](..)**
