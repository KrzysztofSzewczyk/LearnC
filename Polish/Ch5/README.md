
# Rozszerzenie

W tym dziale postaram się przedstawić Ci dodatkowe informacje na temat mechanizmów jakie poznałeś we wcześniejszych częściach książki.

## Tablice - rozszerzenie

Deklarując tablicę i podając jej wartości początkowe, można podać tylko część wartości (<rozmiar tablicy), pozostałe zainicjowane zostaną zerami. Ponadto, można użyć indeksów aby przekazać, które wartości tablicy są inicjowane. Może to się wydać dziwne, ale po ostatnim elemencie tablicy może występować przecinek (aby maszynowa generacja kodu mogła zostać uproszczona).

```
int tab[5] = {1,};
int tab[15] = {0,1,[4]5,[3]=1,4,5,3,};
```

Można to stosować również przy deklaracji tablicach bez podanego rozmiaru:

```
int tab[] = {3, [5]4, 1};  /* 7 */
```

... i przy deklaracji tablic wielowymiarowych:

```
float matrix[4][5] = {
    {0.1, [2]3.4, 5.6},
    [2]{[1]3.7, [3]=8.6},
    {},
    {1.4, 5.3,}
};
```

Definiowanie rozmiaru tablicy - przykład:

```
#define SIZE 3
int main(void) {
   int tab[SIZE] = {1,2,3};
}
```

W C89 rozmiar tablicy nie mógł być określany przez zmienną lub stałą zadeklarowaną przy użyciu słowa kluczowego `const`. Dopiero w C99 dopuszczono taką możliwość. Dlatego do deklarowania rozmiaru tablic często używa się dyrektywy `#define`.

Do poznania wielkości tablicy, można użyć operatora sizeof. Przykład:

```
#include <stdio.h>
int main(void) {
    int tab[3] = {3,6,8}, i;
    for (i = 0; i < (sizeof tab / sizeof *tab); ++i) {
        printf("%d = %d\n", i, tab[i]);
    }
}
```

`sizeof tab` zwraca cały rozmiar pamięciowy tablicy, a `sizeof *tab` zwraca jaki jest rozmiar typu int (ponieważ takiego typu jest `*tab`). Dzieląc rozmiar pamięciowy tablicy przez rozmiar pojedynczego elementu można uzyskać ilość elementów. (`rozmiar == 32 bajty` i `sizeof(int) == 2` => `rozmiar_tablicy = 16`) Należy pamiętać, że sposób działa tylko dla tablic, a nie wskaźników (mimo że wskaźniki traktujemy w pewnym stopniu podobnie jak tablice). Przy odwoływaniu się do konkretnej komórki tablicy, używanym indeksem powinna być liczba, choć istnieje możliwość indeksowania za pomocą np. pojedynczych znaków.

### Ciekawostka - kreatywne zastosowanie tablic.

W pierwszej edycji konkursu IOCCC znajduje się następujące entry:

```
short main[] = {
    277, 04735, -4129, 25, 0, 477, 1019, 0xbef, 0, 12800,
    -113, 21119, 0x52d7, -1006, -7151, 0, 0x4bc, 020004,
    14880, 10541, 2056, 04010, 4548, 3044, -6716, 0x9,
    4407, 6, 5568, 1, -30460, 0, 0x9, 5570, 512, -30419,
    0x7e82, 0760, 6, 0, 4, 02400, 15, 0, 4, 1280, 4, 0,
    4, 0, 0, 0, 0x8, 0, 4, 0, ',', 0, 12, 0, 4, 0, '#',
    0, 020, 0, 4, 0, 30, 0, 026, 0, 0x6176, 120, 25712,
    'p', 072163, 'r', 29303, 29801, 'e'
};
```

Program ten bez przeszkód wykonuje się na komputerach PDP-11. `main` to po prostu tablica z zawartym wewnątrz kodem maszynowym tejże maszyny.

## Zakończenie części o C.

Po przeczytaniu tego rozdziału i indeksu biblioteki standardowej będziesz mógł uznać, że znasz już koniecznie niezbędne podstawy. Będzie czekać Ciebie samodzielna nauka w celu dalszego rozwijania swoich umiejętności. Oto lista niezbędnych stron na których powinieneś posiadać konto / używać:

 * [Stack Overflow](https://stackoverflow.com/tags/c/info) to strona na której możesz zadawać pytania, na które inni programiści mogą Ci odpowiadać. Możesz również samodzielnie odpowiadać na pytania innych w celu zdobycia tzw. punktów reputacji. Bardzo przydaje się wyszukiwarka, ponieważ jest szasna że odpowiedzi na część swoich pytań mozesz znaleźć właśnie tutaj.
 * [GitHub](https://github.com) to strona na której możesz dzielić się projektami z innymi osobami na całym świecie. Ta strona pozwoli Ci opanować podstawy korzystania z systemu kontroli wersji Git.
 * [CCAN](https://ccodearchive.net/index.html) to strona na której możesz przeglądąć fragmenty kodu napisane przez innych programistów, oraz wcielać je do swoich programów.
 * [C reference](https://en.cppreference.com/w/c) to **bardzo** przydatna strona na której m.in. możesz sprawdać różne funkcje biblioteczne.

Uwaga: Na powyższych stronach powinniśmy komunikować się **wyłącznie** w języku angielskim!

Polecam Ci nakierować się na programowanie **niskopoziomowe**. Jeśli uznasz że jesteś gotowy, możesz wrócić do czytania dalszej części tej ksiązki. Materiał którego nauczysz się samodzielnie może przerosnąć całkowity rozmiar tej książki. Jeśli natomiast będziesz mieć problemy ze zrozumieniem kolejnych działów - wróć do nauki. Możesz przejrzeć mój profil na stronie github.com [tu](https://github.com/kspalaiologos/). Przyda ci się znajomość poniższych języków:
 * Java
 * C#
 * Shellscript
 * Dowolny język ezoteryczny (dobre narzędzie do nauki pisania kompilatorów i interpreterów)

Lista projektów w C jakie możesz wykonać:
 * Własna maszyna wirtualna
 * Prosta implementacja języka BASIC-like
 * Dość proste złośliwe programy (nie oszukujmy się, są **wspaniałą** metodą nauki)
 * Hex editor
 * Własna biblioteka implementująca funkcje których często używasz w swoim kodzie
 * Graficzny edytor tekstu (z podświetlaniem składni)
 * Konsolowy edytor tekstu (z podświetlaniem składni)
 * Implementacja rachunku lambd
 * Interpreter lisp-like języka
 * Zaawansowana biblioteka do tworzenia spersonalizowanych logów aplikacji (kolory, poziomy, itd.)
 * Stworzyć własną, prostą architekturę procesora i toolkit dla niej (emulator, asembler, kompilator)
 * Gry: Snake, tetris
 * Język programowania: interpretowany, kompilowany, kompilowany just-in-time.
 * Design najbardziej kompaktowego i zarazem użytecznego języka programowania.
 
Po wykonaniu wybranych z podanych przezemnie projektów, możesz wrócić do czytania kursu asemblera.


