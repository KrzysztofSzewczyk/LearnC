
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
#include "wiki.h"
 
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

**[Powrót do spisu treści](..)**
