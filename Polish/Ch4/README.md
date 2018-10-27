
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

Teraz na STDOUT zostanie wypisany prawidłowy wynik. Przykład ten pochodzi z książki K&R i ma demonstrować niewłaściwe użycie preprocesora

**[Powrót do spisu treści](..)**
