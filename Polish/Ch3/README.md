# Bardziej zaawansowane aspekty programowania w C

W poprzednim rozdziale wspominałem wskaźniki, tablice i struktury. Nauczysz się posługiwać tym niedługo. Jeśli skończysz lekturę tego działu, możesz wrócić na koniec wcześniejszego - wtedy wiele rzeczy powinno Ci się rozjaśnić.

## Tablice

Wcześniej dowiedziałeś się, jak przechowywać pojedyncze liczby oraz znaki. Czasami zdarza się jednak, że potrzebujemy przechować kilka zmiennych jednego typu. Nieprawidłowe jest tworzenie dwudziestu zmiennych w takim stylu:

```
int pasazer1;
int pasazer2;
/* ... */
int pasazer1000;
```

W takich przypadkach z pomocą przychodzi nam tablica.

Tablica to ciąg zmiennych jednego typu. Ciąg taki posiada jedną nazwę a do jego poszczególnych elementów odnosimy się przez numer (indeks). Dekalracja tablicy wygląda podobnie do deklaracji normalnej zmiennej:


```
typ identyfikator[rozmiar];
```

Aby stworzyć tablicę mieszczącą np. 5 elementów, użyjemy takiego kodu:

```
int tab[10];
```

Podobnie jak zmienne, możemy inicjalizować zmienne:

```
int tab[2] = {4, 2};
```

Jeśli inicjalizujesz tablicę, nie musisz podawać jej rozmiaru:

```
int tab[] = {1, 2, 4, 8, 16};
```

Aby zrozumieć praktycznie działanie tablic, weźmy ten przykład:

```
#include <stdio.h>
int main(void) {
     int tab[3] = {3,6,8}, i;
     puts ("Zawartosc tab:");

     for (i=0;i<3;++i) {
         printf ("%d = %d\n", i, tab[i]);
     }
}
```

Tablicami są zwykłymi zmiennymi, które potrafią pomieścić więcej zmiennych. Aby dobrać się do zawartości musimy podać indeks elementu w tablicy. Określa on, z którego elementu chcemy skorzystać spośród wszystkich umieszczonych w tablicy. Numeracja indeksów rozpoczyna się od zera, co oznacza, że pierwszy element tablicy ma indeks równy 0.

Odczyt i zapis wartości do tablicy jest bardzo prosty:

```
int tablica[5] = {0}, i = 0;
tablica[2] = 1;
tablica[3] = 7;
for (i = 0; i != 5; ++i) {
    printf ("tablica[%d]=%d\n", i, tablica[i]);
}
```

Tablice znaków, tj. typu char oraz unsigned char, posiadają dwie ogólnie przyjęte nazwy, zależnie od ich przeznaczenia, bufory ( gdy wykorzystujemy je do przechowywania ogólnie pojętych danych, gdy traktujemy je jako po prostu "ciągi bajtów"; typ char ma rozmiar 1 bajta, więc jest elastyczny do przechowywania np. danych wczytanych z pliku przed ich przetworzeniem) i napisy (gdy zawarte w nich dane traktujemy jako ciągi liter).

```
#include <stdio.h>
#define SIZE 9

void init(char *buf, size_t size){
    int i;
    for(i=0; i<size; i++){
        buf[i] = i + '0';
    }
}

void print(char *buf) {
    int i;
    char c;
    for(i = 0; i < SIZE; i++) {
        c = buf[i];
        if(c == '\0') {
            printf("\\0");
        } else {
            putchar(buf[i]);
        }
    }
    printf("\n");
}


int main(){
    char buf[SIZE];
    init(buf, SIZE);
    print(buf);

    init(buf, BUFSIZE);
    snprintf(buf, BUFSIZE, "hello there!");
    print(buf);

    init(buf, BUFSIZE);
    snprintf(buf, BUFSIZE, "abcdef");
    print(buf);

    init(buf, BUFSIZE);
    snprintf(buf, 1, "%d", 2 * 2);
    print(buf);
}
```

Rozważmy teraz konieczność przechowania w pamięci komputera całej macierzy o wymiarach 10 x 10. Można by tego dokonać tworząc 10 osobnych tablic jednowymiarowych, reprezentujących poszczególne wiersze macierzy. Jednak język C dostarcza nam dużo wygodniejszej metody, która w dodatku jest bardzo łatwa w użyciu. Są to tablice wielowymiarowe, lub inaczej "tablice tablic". Tablice wielowymiarowe definiujemy podając przy zmiennej kilka wymiarów, np.:

```
float matrix[10][10];
```

Tak samo wygląda dostęp do poszczególnych elementów tablicy:

```
matrix[2][1] = 3.7;
```

Ten sposób jest dużo wygodniejszy niż deklarowanie 10 osobnych tablic jednowymiarowych. Aby zainicjować tablicę wielowymiarową należy zastosować zagłębianie klamr:

```
float matrix[3][4] = {
    { 1.2, 3.4, 5.6, 7.8 },
    { 1.2, 3.4, 5.6, 7.8 },
    { 1.2, 3.4, 5.6, 7.8 }
};
```

Dodatkowo, pierwszego wymiaru nie musimy określać (podobnie jak dla tablic jednowymiarowych) i wówczas kompilator sam ustali odpowiednią wielkość:

```
float matrix[][4] = {
    { 1.2, 3.4, 5.6, 7.8 },
    { 1.2, 3.4, 5.6, 7.8 },
    { 1.2, 3.4, 5.6, 7.8 },
    { 1.2, 3.4, 5.6, 7.8 }
};
```

Innym sposobem deklarowania tablic wielowymiarowych jest użycie wskaźników. Dowiesz się o nich niedługo. Pomimo swej wygody tablice statyczne mają ograniczony, z góry zdefiniowany rozmiar, którego nie można zmienić w trakcie działania programu. Dlatego też w niektórych zastosowaniach tablice statyczne zostały wyparte tablicami dynamicznymi, których rozmiar może być określony w trakcie działania programu. Zagadnienie to zostało opisane w następnym rozdziale. Możesz też używać VLA, ale nie jest to zalecane; taka konstrukcja wygląda tak:

```
int zmienna = xyz; /* nie jest znane w trakcie kompilacji programu */
int tab[zmienna];
```

Wystarczy pomylić się o jedno miejsce by spowodować, że działanie programu zostanie nagle przerwane przez system operacyjny:

```
int foo[20];
int bar;
 
for (bar = 0; bar <= 20; bar += 1) /* i < 20 */
    foo[bar] = 0;
```

## Wskaźniki

Słowem wstępu; Wskaźniki mogą być dla Ciebie najtrudniejszą częścią języka C jak na chwilę obecną. Jeśli nie rozumiesz materiału znajdującego się w tej sekcji - spróbuj przetrawić to jeszcze raz.

Zmienne w komputerze są przechowywane w pamięci. To wie programista każdego języka, natomiast tylko programiści najlepszych języków są w stanie manualnie przydzielać i obsługiwać pamięć dla zmiennych. W tym celu pomocne są wskaźniki.

Uwaga: Dla ułatwienia przyjmuję, że bajt = 8 bitów, int = 2 bajty, long = 4 bajty, a liczby zapisane są w formacie big endian, co niekoniecznie musi być prawdą na używanej przez Ciebie maszynie.

Wskaźnik (ang. pointer) to rodzaj zmiennej, w której zapisany jest adres w pamięci. Oznacza to, że wskaźnik wskazuje miejsce, gdzie zapisana jest jakaś inna zmienna.

Obrazowo możemy wyobrazić sobie pamięć komputera jako sklep z elektroniką a zmienne jako szufladki. Możemy podać sprzedawcy listę z częściami, które chcemy kupić, a on znajdzie je za nas. Analogia ta nie jest wspaniała, ale pozwala wyobrazić sobie niektóre cechy wskaźników: numer identyfikuje pewną część, kilka numerów może dotyczyć tego samego komponentu, numery na kartce możemy skreślić i użyć do zamówienia innych części, a jeśli poprosimy nieprawidłowy o numer części, to możemy dostać nie tą część, którą chcemy, albo też nie dostać nic (bo takiej części nie ma).

Warto też przytoczyć w tym miejscu definicję adresu. Możemy powiedzieć, że adres to pewna liczba, jednoznacznie definiująca położenie pewnego obiektu. Tymi obiektami mogą być np. zmienne, elementy tablic czy nawet funkcje.

Podstawy używania wskaźników:

```
* -> wyłuskanie wskaźnika, przykład:
int * ptr = /* ..., jakiś adres */;
*ptr -> wyrażenie zwracające dane znajdujące się pod jakimś adresem interpretowane jako określony typ danych.

* -> deklaracja wskaźnika:
int * wskaznik;

& -> pobranie adresu ze zmiennej, np.
int zmienna = 42;
int * wskaznik = &zmienna;
*wskaznik; /* =42 */
```

By stworzyć wskaźnik do zmiennej i móc go używać, trzeba przypisać mu odpowiednią wartość, będącą adresem zmiennej, na jaką chcesz aby wskazywał. W C można otrzymać adres zmiennej za pomocą operatora & (operatora pobrania adresu). Przykład:


```
#include <stdio.h>

int main(void) {
    int zmienna = 42;
    printf("Wartosc: %d\n", zmienna);
    printf("Adres: %p\n", &zmienna);
}
```

Program ten wypisuje adres w pamięci, pod którym znajduje się zmienna oraz wartość jaką ma. Przykładowy wynik:

```
$ gcc -o main main.c
$ ./main
Wartosc: 42
Adres: 7FFC83B6E1EC
```

Aby móc przechowywać taki adres deklaruje się zmienną wskaźnikową. Ważną informacją oprócz adresu wskazywanej zmiennej jest jej typ. Mimo że wskaźnik jest zawsze typu adresowego, kompilator wymaga aby przy deklaracji podany został typ zmiennej, na którą wskaźnik będzie wskazywał. Robi się to poprzez dodanie * przed nazwą wskaźnika:

```
int *ptr1;
char *otr2;
double *ptr;
```

Szczególnie młodsi programiści mogą błędnie interpretować wskaźnik do typu jako nowy typ i uważać, że podany kod:

```
int * a, b, c;
```

tworzy trzy zmienne będące wskaźnikami typu int. W rzeczywistości uzyskany zostanie jeden wskaźnik a, oraz dwie liczby całkowite b i c. W tym przypadku trzy wskaźniki można otrzymać pisząc:

```
int * a, * b, * c;
```

Najlepiej byłoby unikać mieszania deklaracji zwykłych zmiennych i wskaźników w następujący sposób:

```
int *a;
int b, c;
```

Aby dobrać się do wartości wskazywanej przez wskaźnik, należy użyć operatora \*, zwanego również operatorem wyłuskania. Gwiazdka użyta w tym kontekście ma zupełnie inne przeznaczenie, niż podawane wcześniej. Jest tak, ponieważ jest używana w zupełnie innym miejscu, nie przy deklaracji zmiennej, a przy jej użyciu gdzie odgrywa rolę operatora, podobnie jak &. Przykład:

```
#include <stdio.h>

int main(void) {
    int zmienna = 123;
    int *wskaznik = &zmienna;
    printf("Wartosc: %d, adres: %p.\n", zmienna, &zmienna);
    printf("Adres: %p, po wyluskaniu: %d.\n", wskaznik, *wskaznik);
    *wskaznik = 42;
    printf("Wartosc: %d, po wyluskaniu: %d\n", zmienna, *wskaznik);
    zmienna = 0x42;
    printf("Wartosc: %d, po wyluskaniu: %d\n", zmienna, *wskaznik);
}
```

Przykładowy wynik programu:

```
Wartosc: 123, adres: 7FFF124599E4.
Adres: 7FFF124599E4, po wyluskaniu: 123.
Wartosc: 42, po wyluskaniu: 42
Wartosc: 66, po wyluskaniu: 66
```

Czasami argumentami funkcji są wskaźniki. W przypadku zwykłych zmiennych, funkcja otrzymuje lokalne kopie argumentów które zostały jej podane. Wszelkie zmiany dokonują się lokalnie i nie są widziane poza funkcją. Przekazując do funkcji wskaźnik, również zostaje stworzona kopia wskaźnika, na którym możemy operować. Tu jednak kopiowanie i niewidoczne lokalne zmiany się kończą. Obiekt, na który wskazuje ten wskaźnik, znajduje się gdzieś w pamięci i możemy działać na oryginale, więc zmiany są widoczne po wyjściu z funkcji. Przykład:

```
#include <stdio.h>

void fvar (int zmienna) {
    zmienna = 4;
}
void fptr (int * wskaznik) {
    *wskaznik = 5;
}

int main (void) {
    int x=3;
    printf("x=%d\n", x);
    fvar(x);
    printf("x=%d\n", x);
    fptr(&x);
    printf("x=%d\n", x);
}
```

Wynik:

```
x=3
x=3
x=5
```

Funkcje w języku C nie tylko potrafią zwracać wartości, ale także zmieniać dane, podane jako argumenty. Ten sposób przekazywania argumentów do funkcji jest nazywany przekazywaniem przez wskaźnik (w przeciwieństwie do normalnego przekazywania przez wartość).

Uwaga! fptr(&zmienna); - należy pamiętać, by do funkcji oczekującej wskaźnika przekazać adres zmiennej, a nie zmienną. Jeśli byśmy napisali func_pointer(z); wówczas funkcja użyłaby liczby 3 jako adres i starałaby się zmienić komórkę pamięci o numerze 3. Kompilator powinien ostrzec w takim przypadku o konwersji z typu int do wskaźnika, ale jeśli zignorujemy ostrzeżenie, nasz program prawdopodobnie zakończy swoje działanie przedwcześnie.

Ważne jest, aby przy posługiwaniu się wskaźnikami nigdy nie próbować odwoływać się do komórki wskazywanej przez wskaźnik o wartości NULL ani nie używać dzikiego wskaźnika! Przykładem nieprawidłowego kodu może być np.:

```
int * ptr;
printf("%d\n", *ptr);
wsk = NULL;
printf("%d\n", *ptr);
```

Operator sizeof dla zmiennej wskaźnikowej zwraca rozmiar adresu, a nie typu, uwaga! Jeśli chcesz znać rozmiar typu, najpierw wyłuskaj wskaźnik.

```
char * ptr;
sizeof zmienna;     /* u mnie, =4 */
sizeof(char*);      /* to samo */
sizeof *ptr;        /* tym razem =1 */
sizeof(char);       /* to smo */
```

Podobnie jak możemy deklarować zwykłe stałe, tak samo możemy mieć stałe wskaźniki - jednak są ich dwa rodzaje. Wskaźniki na stałą wartość - `const int * a;` oraz stałe wskaźniki `int * const b;`, const przed typem działa jak w przypadku zwykłych stałych, tzn. nie można zmienić wartości wskazywanej przez wskaźnik. W drugim przypadku const jest tuż za gwiazdką oznaczającą typ wskaźnikowy, co skutkuje stworzeniem stałego wskaźnika, czyli takiego którego nie można przestawić na inny adres. Obie opcje można połączyć, deklarując stały wskaźnik, którym nie można zmienić wartości wskazywanej zmiennej, i również można zrobić to na dwa sposoby:

```
const int * const c;
/* lub */
int const * const c;
```

Przykłady:

```
int zmienna = 2;
const int *a=&zmienna;
int * const b=&zmienna;
int const * const c=&zmienna;
*a = 1;  /* nie ok */
*b = 3;  /* ok */
*c = 7;   /* nie ok */
a = b;   /* ok */
b = a;   /* nie ok */
c = a;   /* nie ok */
```

Wskaźniki na stałą wartość są przydatne między innymi w sytuacjach wymagających przekazania dużego obiektu (np. struktury z 10+ polami polami). Jeśli przypiszemy taką zmienną do innej zmiennej, kopiowanie może potrwać dużo czasu, a oprócz tego zostanie zajęte dużo pamięci. Przekazanie takiej struktury do funkcji albo zwrócenie jej jako wartość funkcji wiąże się z takim samym narzutem. W takim wypadku dobrze jest użyć wskaźnika na stałą wartość.

```
 void funkcja(const struktura *s) {
    /* jakiś kod robiący coś na strukturze */
 }
 
 /* Gdzieś, możliwe że w main(): */
 
 funkcja(&dane); /* dane nie zostaną zmienione */
```

Czy nie dałoby się mieć tablic, których rozmiar dostosowuje się do potrzeb a nie jest na stałe zapisany w kodzie programu? Chcąc pomieścić więcej danych możemy po prostu zwiększyć rozmiar tablicy - ale gdy do przechowania będzie mniej elementów okaże się, że marnujemy pamięć. Język C umożliwia dzięki wskaźnikom i dynamicznej alokacji pamięci tworzenie tablic o wielkości która może nie być wstępnie znana na początku programu. Normalnie zmienne programu przechowywane są na stosie - powstają, gdy program wchodzi do bloku, w którym zmienne są zadeklarowane a zwalniane w momencie, kiedy program opuszcza ten blok. Jeśli tablice są deklarowane w ten sposób, to ich rozmiar musi być znany w momencie kompilacji - żeby kompilator wygenerował kod rezerwujący odpowiednią ilość pamięci. Dostępny jest jednak drugi rodzaj alokacji pamięci, alokacja na stercie. Sterta to obszar pamięci wspólny dla całego programu, przechowywane są w nim zmienne, których czas życia nie jest związany z poszczególnymi blokami. Programista musi manualnie zarządzać, kiedy miejsce na stercie zostanie zarezerwowane, a kiedy zostanie zwolnione.

Należy pamiętać, że rezerwowanie i zwalnianie pamięci na stercie zajmuje więcej czasu niż analogiczne działania na stosie. Dodatkowo, zmienna zajmuje na stercie więcej miejsca niż na stosie - sterta utrzymuje specjalną strukturę, w której trzymane są wolne partie (może to być np. lista). Tak więc używajmy dynamicznej alokacji tam, gdzie jest potrzebna - dla danych, których rozmiaru nie jesteśmy w stanie przewidzieć na etapie kompilacji lub ich żywotność ma być niezwiązana z blokiem, w którym zostały zaalokowane.

Podstawową funkcją do rezerwacji pamięci jest funkcja malloc. Jest to niezbyt skomplikowana funkcja - podając jej rozmiar (w bajtach) potrzebnej pamięci, dostajemy wskaźnik do zaalokowanego obszaru. Przykład:

```
/* Pamiętaj o "#include <stdlib.h>" */

int size = 3; /* Załózmy że rozmiar nie jest znany w czasie kompilacji */
float *tab;
tab = (float*) malloc(size * sizeof(float));
tab[0] = 21.37;
```

Najpierw deklarowane są zmienne - rozmiar tablicy i wskaźnik, który będzie wskazywał obszar w pamięci, w którym będzie przechowywana tablica. `size * sizeof(float)` oblicza potrzebną wielkość tablicy. Dla każdej zmiennej float potrzebujemy tyle bajtów, ile zajmuje jedna taka w pamięci. Ponieważ może się to różnić na innych maszynach, istnieje operator sizeof zwracający rozmiar danego typu w bajtach.

Należy sprawdzić, czy funkcja malloc nie zwróciła wartości NULL - dzieje się tak, gdy zabrakło pamięci. Może się tak stać również jeżeli jako argument funkcji podano zero.

Jeśli dany obszar pamięci nie będzie już więcej potrzebny trzeba go zwolnić, aby system operacyjny mógł go przydzielić innym potrzebującym procesom. Do zwolnienia obszaru pamięci używamy funkcji free(), która przyjmuje tylko jeden argument - wskaźnik, który otrzymany przez malloc().

```
free(tab);
```

Należy pamiętać o zwalnianiu pamięci - inaczej dojdzie do tzw. wycieku pamięci - program będzie rezerwował nową pamięć, ale nie zwracał jej z powrotem i w końcu pamięci może mu zabraknąć.

Należy też uważać, by nie zwalniać dwa razy tego samego miejsca. Po wywołaniu free wskaźnik nie zmienia wartości, pamięć wskazywana przez niego może też nie od razu ulec zmianie. Jest szansa że czasem program nieświadomie korzysta ze wskaźnika po wywołaniu free nie orientując się, że jest coś nie tak - w pewnym momencie działanie programu kończy się błędem, przeważnie typu Segmentation Fault.

Można zmienić rozmiar bloku zaalokowanego przez malloc:

```
tab = realloc(tab, 2*size*sizeof(float));

/* Trochę mądrzejszy przykład: */

int * p;
void * tmp;
p = malloc(10 * sizeof(int));
if ( (tmp = realloc(p, 20 * sizeof(int))) == NULL ) {
    /* Błąd */
} else
    p = tmp;
free(p);
```

Funkcja ta zwraca wskaźnik do bloku pamięci o pożądanej wielkości (lub NULL gdy zabrakło pamięci). Uwaga - może to być inny wskaźnik. Jeśli zażądamy zwiększenia rozmiaru a za zaalokowanym aktualnie obszarem nie będzie wystarczająco dużo wolnego miejsca, funkcja znajdzie nowe miejsce i przekopiuje tam starą zawartość. Jak widać, wywołanie tej funkcji może być więc kosztowne pod względem czasu.

Ostatnią funkcją jest funkcja calloc(). Przyjmuje ona dwa argumenty: liczbę elementów tablicy oraz wielkość pojedynczego elementu. Podstawową różnicą pomiędzy funkcjami malloc() i calloc() jest to, że ta druga zeruje wartość przydzielonej pamięci (do wszystkich bajtów wpisuje wartość 0).

Tutaj znajduje się krótka lista, jak definiować wskaźniki oraz co oznaczają poszczególne definicje:

```
int i;          /* zmienna typu int */

int i[];        /* tablica typu int */
int *i[];       /* tablica wskaźników na int */

int * i;        /* wskaźnik na int */
int **i;        /* wskaźnik na wskaźnik na int */
int (*i)[];     /* wskaźnik na tablicę int */
int (*i)();     /* wskaźnik na funkcję zwracającą int */
int ***i;       /* wskaźnik na wskaźnik na wskaźnik na int */
int (**i)[];    /* wskaźnik na wskaźnik na tablicę int */
int (**i)();    /* wskaźnik na wskaźnik funkcji zwracającej int */
int *(*i)[];    /* wskaźnik na tablicę wskaźników na int */
int *(*i)();    /* wskaźnik na funkcję zwracającą wskaźnik na int*/

int **i[];      /* tablica wskaźników na wskaźniki na int */
int (*i[])[];   /* tablica wskaźników na tablicę int */
int (*i[])();   /* tablica wskaźników na funkcje zwracające int */

int i();        /* funkcja zwracająca int */
int *i();       /* funkcja zwracająca wskaźnik int */
int **i();      /* funkcja zwracająca wskaźnik na wskaźnik na int */
int (*i())[];   /* funkcja zwracająca wskaźnik na tablicę int */
int (*i())();   /* funkcja zwracająca wskaźnik na funkcję zwracającą int */
```

Jednym z najczęstszych błędów oprócz próby wyłuskania NULL, są odwołania się do obszaru pamięci po jego zwolnieniu. Po wykonaniu funkcji free() nie możemy już wykonywać żadnych odwołań do zwolnionego obszaru. Innymi rodzajami błędów są również odwołania do adresów pamięci które są poza obszarem przydzielonym funkcją malloc() i stosem, zapominanie sprawdzania czy dany wskaźnik nie ma wartości NULL, wycieki pamięci -gubienie wskaźników do zaalokowanej pamięci i zwalnianie tylko części przydzielonej wcześniej pamięci i odwołania do obszarów w których nie ma prawidłowych danych (np. poprzez rzutowanie wskaźnika na nieodpowiedni typ).

Przykład funkcji powodującej wyciek pamięci:

```
#include <stdlib.h>
 
int main(void) {
     int *ptr = (int *) malloc(sizeof(int));
     
     return 0; /* free()? */
}
```

Aby sprawdzić czy program nie ma wycieków pamięci, możemy użyć Valgrinda w następujący sposób:
(uwaga, musisz najpierw skompilować ten program komendą np. `gcc main.c` jeśli plik nazywa się main.c)

```
$ valgrind ./a.out
==20583== Memcheck, a memory error detector
==20583== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==20583== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
==20583== Command: ./a.out
==20583==
==20583==
==20583== HEAP SUMMARY:
==20583==     in use at exit: 4 bytes in 1 blocks
==20583==   total heap usage: 1 allocs, 0 frees, 4 bytes allocated
==20583==
==20583== LEAK SUMMARY:
==20583==    definitely lost: 4 bytes in 1 blocks
==20583==    indirectly lost: 0 bytes in 0 blocks
==20583==      possibly lost: 0 bytes in 0 blocks
==20583==    still reachable: 0 bytes in 0 blocks
==20583==         suppressed: 0 bytes in 0 blocks
==20583== Rerun with --leak-check=full to see details of leaked memory
==20583==
==20583== For counts of detected and suppressed errors, rerun with: -v
==20583== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 6 from 3)
```

Powinno być:

```
#include <stdlib.h>
 
int main(void) {
     int *ptr = (int *) malloc(sizeof(int));
     free(ptr);
     return 0;
}
```

I prawidłowe wyjście:

```
$ valgrind ./a.out
==20832== Memcheck, a memory error detector
==20832== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==20832== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
==20832== Command: ./a.out
==20832==
==20832==
==20832== HEAP SUMMARY:
==20832==     in use at exit: 0 bytes in 0 blocks
==20832==   total heap usage: 1 allocs, 1 frees, 4 bytes allocated
==20832==
==20832== All heap blocks were freed -- no leaks are possible
==20832==
==20832== For counts of detected and suppressed errors, rerun with: -v
==20832== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 6 from 3)
```

## Napisy

Komputer dawno temu przestał być narzędziem wyłącznie do przetwarzania danych. Od programów komputerowych wymaga się też czegoś innego - program w wyniku swojego działania nie ma zwracać danych rozumianych tylko przez autora programu, ale być tak zaprojektowany aby przeciętny użytkownik mógł bez problemu programu używać. Do przechowywania komunikatów służą tzw. ciągi znaków.

Język C nie jest wygodnym narzędziem do manipulacji napisami. Zestaw funkcji umożliwiających operacje na napisach w bibliotece standardowej C jest bardzo mały. Dodatkowo problemem jest sposób przechowywania ciągów w pamięci. Pokażę Ci też, jak stworzyć łańcuch typu linked list.

Z drugiej strony, ciągi mogą być przyczyną wielu trudnych do wykrycia błędów w programach. Warto zrozumieć, jak należy operować na nich i zachować ostrożność w tych miejscach gdzie ciągi są używane.

Przykładowy ciąg znaków wygląda tak:

```
printf ("Hello, world!");
```

Jak widać, są to po prostu znaki zamknięte w cudzysłowach. W pamięci każdy napis jest następującym po sobie ciągiem znaków, który kończy się znakiem "null", zapisywanym jako '\0'.

W napisie, do poszczególnych znaków odwołujemy się jak w tablicy:

```
const char *napis = "Abc";
printf("%c\n", "C jest proste"[0]); /* C */
printf("%c\n", napis[2]);      /* c */
```

Napis w pamięci kończy się zerem umieszczonym tuż za jego zawartością. Odwołanie się do znaku o indeksie równym długości napisu zwróci zero:

```
printf("%d", "test"[4]);       /* 0 */
```

Napisy można wczytywać z klawiatury i wypisywać na ekran przy pomocy funkcji scanf, printf i innych, które już poznałeś. Formatem używanym dla napisów jest %s.

```
printf("%s", zmienna);
```

Większość funkcji działających na napisach znajduje się w pliku nagłówkowym string.h, który dołączamy podobnie jak np stdio.h lub stdlib.h:

```
#include <string.h>
```

Jeśli ciąg jest długi można zapisać go w kilku liniach, przechodząc do następnej musimy na jej końcu postawić znak "\".

```
printf("to jest \
przyklad dlugiego ciagu");
```

Rezultat:

```
to jest przyklad dlugiego ciagu
```

Napis, który w programie zajął więcej niż jedną linię, w praktyce zajął tylko jedną. "\" informuje kompilatoo dalszej części ciągu w następnej linijce kodu - "\" nie ma wpływu na prezentację łańcucha. Aby wydrukować napis w kilku liniach należy wstawić do niego \n ("n" pochodzi tu od "new line", czyli "nowa linia").

```
printf("Abc\ndef\nghi");
```

W wyniku otrzymamy:

```
Abc
def
ghi
```

Zmienna, która przechowuje łańcuch znaków, jest tak naprawdę wskaźnikiem do pierwszego elementu tablicy znaków w pamięci. Możemy też myśleć o napisie jako o tablicy znaków.

Możemy wygodnie zadeklarować napis:

```
const char *tekst  = "Abc"; /* Tego napisu nie możemy modyfikować. Każdy napis typu `char * ` zawsze będzie read only */
char tekst[] = "Abc";
char tekst[] = {'A','b','c','\0'};
```

Kompilator automatycznie przydziela wtedy odpowiednią ilość pamięci (tyle bajtów, ile jest liter plus jeden dla kończącego \0). Jeśli natomiast wiemy, że dany łańcuch powinien przechowywać określoną ilość znaków (nawet, jeśli w deklaracji tego łańcucha podajemy mniej znaków) deklarujemy go w taki sam sposób, jak tablicę jednowymiarową:

```
char ciag[42] = "Ten tekst musi być krótszy niż 42 znaki";
```

Należy cały czas pamiętać, że napis jest tak naprawdę tablicą. Jeśli dla napisu zostało zarezerwowane 80 znaków, to przypisanie do niego dłuższego napisu będzie pisaniem po pamięci, której nie chcielibyśmy zmienić.

Deklaracja `const char *napis = "abc";` oraz `char napis[] = "abc";` pomimo, że wyglądają podobnie, bardzo się różnią. W przypadku pierwszej deklaracji próba zmodyfikowania napisu może wyświetlać błąd kompilacji. Dzieje się tak dlatego, że const `char *tekst = "cokolwiek";` deklaruje wskaźnik na stały obszar pamięci.

Pisanie po pamięci może czasami skończyć się błędem dostępu do pamięci ("segmentation fault") i zamknięciem programu, jednak może zdarzyć się jeszcze inna rzecz - można zmienić w ten sposób przypadkowo wartość innych zmiennych. Program zacznie wtedy zachowywać się nieprzewidywalnie - zmienne a nawet stałe, co do których zakładaliśmy, że ich wartość będzie ściśle ustalona, mogą przyjąć taką wartość, jaka absolutnie nie powinna mieć miejsca.

Kluczowy jest też kończący napis znak null. Wszystkie funkcje operujące na napisach opierają właśnie na nim. Strlen szuka rozmiaru napisu idąc od początku i zliczając znaki, aż nie natrafi na znak o kodzie zero. Jeśli napis nie kończy się znakiem null, funkcja będzie szła dalej po pamięci. Na szczęście, wszystkie operacje podstawienia typu `var = "abcdef";` powodują zakończenie napisu nullem (o ile jest na niego miejsce).

W łańcuchu #3 ostatnim znakiem jest znak o wartości zero ('\0'). Jednak łańcuchy mogą zawierać inne sekwencje sterujące, np.:

```
'\a' - "beep" terminala.
'\b' - usuwa poprzedzający znak (w konsoli Windowsa cofa kursor w lewo bez usuwania znaku)
'\f' - wysuniecie strony
'\r' - powrót karetki
'\n' - nowy wiersz
'\'' - apostrof
'\\' - backslash
'\t' - tabulacja pozioma
'\v' - tabulacja pionowa
'\ohh' - liczba zapisana w systemie oktalnym, gdzie 'hh' należy zastąpić liczbą w tym systemie
'\xhh' - liczba zapisana w systemie heksadecymalnym, gdzie 'hh' należy zastąpić dwucyfrową liczbą w tym systemie
'\unnnn' - uniwersalna forma; 'nnnn' należy zastąpić czterocyfrowym identyfikatorem znaku w systemie szesnatkowym.
```

Znak nowej linii ('\n') jest w różny sposób przechowywany na różnych platformach. W niektórych systemach używa się do tego jednego znaku o kodzie 0x0A (Line Feed - nowa linia). Do tej rodziny zaliczamy systemy z rodziny Unix. Drugą konwencją jest zapisywanie '\n' za pomocą dwóch znaków: LF (Line Feed) + CR (Carriage return - powrót karetki). Znak CR reprezentowany jest przez wartość 0x0D. Kombinacji tych dwóch znaków używaja m.in. Windows. Trzecia grupa systemów używa do tego celu samego znaku CR, oprogramowanie na Commodore i Apple II. W związku z tym plik utworzony w systemie Linux może prezentować się inaczej pod systemem Windows.

Używając zwykłego operatora porównania ==, otrzymamy wynik porównania adresów a nie tekstów, bo ciągi są wskaźnikami.

Do porównywania dwóch ciągów znaków należy użyć funkcji strcmp zadeklarowanej w pliku nagłówkowym string.h. Jako argument przyjmuje dwa napisy i zwraca wartość ujemną jeżeli pierwszy jest mniejszy od drugiego, 0 jeżeli napisy są równe lub wartość dodatnią jeżeli napis pierwszy jest większy od drugiego. Przyjmując kodowanie ASCII "a" jest mniejsze od "b", ale jest większe od "B". Np.:

```
#include <stdio.h>
#include <string.h>
 
int main(void) {
    char str1[100] = {'\0'}, str2[100] = {'\0'};
    int cmp;
 
    puts("Wpisz dwa ciagi ponizej ");
    fgets(str1, sizeof str1, stdin);
    fgets(str2, sizeof str2, stdin);
 
    cmp = strcmp(str1, str2);
    if (cmp<0) {
        puts("cmp<0");
    } else if (cmp>0) {
        puts("cmp>0");
    } else {
        puts("cmp=0");
    }
 
   return 0;
}
```

Czasami trzeba porównać tylko fragment napisu, np. sprawdzić czy zaczyna się od jakiegoś tekstu. W takich sytuacjach pomocna jest funkcja strncmp. W porównaniu do strcmp() przyjmuje ona jeszcze jeden argument oznaczający maksymalną liczbę znaków do porównania. Przykład:

```
#include <stdio.h>
#include <string.h>

int main(void) {
    char str[100];
    int cmp;
    fputs("> ", stdout);
    fgets(str, 100, stdin);
    if (!strncmp(str, "abc", 3))
        puts("Ciag zaczyna sie od 'abc'.");
    return 0;
}
```

Do kopiowania ciągów znaków służy funkcja strcpy, która kopiuje drugi napis w miejsce pierwszego. Musimy pamiętać, by w pierwszym łańcuchu było wystarczająco dużo miejsca.

```
char napis[100];
strcpy(napis, "Ala ma kota.");
```

Bezpieczniej jest używać funkcji strncpy, która kopiuje najwyżej tyle znaków ile podano jako trzeci parametr. Jeżeli drugi napis jest za długi, strncpy() nie kopiuje znaku null na koniec napisu, dlatego zawsze trzeba to robić ręcznie. Przykład:

```
char napis[100] = { 0 };
strncpy(napis, "Ala ma kota.", sizeof(napis) - 1);
```

Do łączenia napisów służy strcat(), która kopiuje drugi napis do pierwszego. Ponownie jak w przypadku strcpy musimy zagwarantować, by w pierwszym łańcuchu było wystarczająco dużo miejsca.

```
#include <stdio.h>
#include <string.h>

int main(void) {
    char s1[30] = "Hello, ";
    const const char * s2 = "world";
    strcat(s1, s2);
    puts(s1);
}
```

Istnieje strncat, funkcja która skopiuje maksymalnie tyle znaków ile podano jako trzeci argument i dopisze znak null.

```
#include <stdio.h>
#include <string.h>

int main(void) {
    char s1[30] = "Hello, ";
    const const char * s2 = "world";
    strncat(s1, s2, 2);
    puts(s1);
}
```

Można też wykorzystać trzeci argument do zapewnienia bezpiecznego wywołania funkcji kopiującej. W przypadku zbyt małej tablicy skopiowany zostanie fragment tylko takiej długości, na jaki wystarczy miejsca. Przy podawaniu ilości znaków należy także pamięta, że tablica, do której kopiujemy nie musi być pusta, a więc część pamięci przeznaczona na nią jest już zajęta, jak w poniższym przykładzie. Dlatego od rozmiaru całego napisu do którego dane są kopiowane należy odjąć długość napisu, który już się w nim znajduje.

```
char s1[10] = "hello ";
const char * s2 = "world";
strncat(s1, s2, sizeof(s1)-strlen(s1)-1);
puts(napis1);
```

Osoby, które programują w językach skryptowych muszą uważać na łączenie i kopiowanie napisów. Kompilator nie wykryje nadpisania pamięci za napisem i nie przydzieli dodatkowego obszaru pamięci. Czasami program pomimo nadpisywania pamięci za ciągiem będzie nadal działał, co utrudni wykrywanie błędów.

Niektóre ciągi mogą okazać się zabójcze dla bezpieczeństwa programu. "W jaki sposób ciąg może zaszkodzić programowi?" - przykład:

```
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, const char ** argv) {
    char isvalid = 0;
    char password[16];
    if (argc != 2) {
        fprintf(stderr, "Usage: %s password", argv[0]);
        return EXIT_FAILURE;
    }
    strcpy(password, argv[1]);
    if (!strcmp(password, "123"))
        isvalid = 1;
    if (!isvalid) {
        fputs("Access Deined.\n", stderr);
        return EXIT_FAILURE;
    }
    puts("Access Granted.");
    return EXIT_SUCCESS;
}
```

Uwaga: Ogólnie przyjmuje się, że czysty i prawidłowy kod zawiera komentarze i nazwy zmiennych wyłącznie w języku angielskim. Od tej części podręcznika, zacznę się stosować do tej zasady.

Ten program wykonuje jakąś akcję jeżeli podane jako pierwszy argument hasło jest poprawne. Sprawdźmy czy działa:

```
$ ./a.out abc
Access Deined
$ ./a.out 123
Access Granted
```

Użycie funkcji strcpy sprawia, że osoba o potencjalnie złych zamiarach nie musi znać hasła, aby program uznał że zna hasło:

```
$ ./a.out 111111111111111111111111111111
Access Granted
```

Podany został ciąg dłuższy od przewidywanego bufora. Funkcja strcpy() kopiując znaki do bufora password przekroczyła przewidziane dla niego miejsce i kopiowała dalej - tam, gdzie znajdowała się zmienna isvalid. strcpy() wpisała jedynkę do isvalid, co sprawiło że warunek w if się spełnił.

Podany przykład może się różnie zachowywać w zależności od różnych czynników, ale ogólnie mamy do czynienia z poważnym niebezpieczeństwem. Sytuację taką nazywamy przepełnieniem bufora. Należy bardzo uważać na tego typu błędy, a w miejsce strcpy stosować bardziej strncpy.

Oto bezpieczna wersja poprzedniego programu:

```
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, const char ** argv) {
    char isvalid = 0;
    char password[16];
    if (argc != 2) {
        fprintf(stderr, "Usage: %s password", argv[0]);
        return EXIT_FAILURE;
    }
    strncpy(password, argv[1], sizeof(password) - strlen(password) - 1);
    password[sizeof password - 1] = '\0';
    if (!strcmp(password, "123"))
        isvalid = 1;
    if (!isvalid) {
        fputs("Access Deined.\n", stderr);
        return EXIT_FAILURE;
    }
    puts("Access Granted.");
}
```

Bezpiecznymi alternatywami do strcpy i strcat są funkcje strlcpy oraz strlcat opracowane przez OpenBSD i dostępne do pobrania na wolnej licencji, strlcpy, strlcat. strlcpy() działa podobnie do strncpy: `strlcpy (buf, argv[1], sizeof buf);`, jednak jest szybsze i zawsze kończy napis nullem. strlcat() działa jak `strncat(dst, src, size-1)`.

Inną niebezpieczną funkcją jest np. gets() zamiast której należy używać fgets.

Napisy można alokować dynamicznie:

```

```

Zawsze możemy też użyć łańcucha typu linked list:

```
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, const char ** argv) {
    char isvalid = 0;
    const char * password;
    if (argc != 2) {
        fprintf(stderr, "Usage: %s password", argv[0]);
        return EXIT_FAILURE;
    }
    password = malloc(strlen(argv[1]) + 1);
    if (!password) {
        fputs("Out of memory.", stderr);
        return EXIT_FAILURE;
    }
    strcpy(password, argv[1]);
    if (!strcmp(haslo, "123"))
        isvalid = 1;
    if (!isvalid) {
        fputs("Access Deined.\n", stderr);
        return EXIT_FAILURE;
    }
    puts("Access granted.");
    free(haslo);
}
```

Wielu programistów, nieświadomych potencjalnego zagrożenia używa tego typu konstrukcji:

```
#include <stdio.h>
int main(int argc, const char ** argv) {
    printf(argv[1]);
}
```
Jest to bardzo poważny błąd programu! Prawidłowo napisany kod powinien wyglądać następująco:

```
#include <stdio.h>
int main(int argc, const char **argv) {
     printf("%s", argv[1]);
}
```

lub:

```
#include <stdio.h>
int main(int argc, const char **argv) {
     puts(argv[1]);
}
```

Źródło problemu leży w konstrukcji printf() - przyjmuje ona za pierwszy parametr ciąg, który następnie przeszukuje w poszukiwaniu formatu. Jeśli `argv[1]` będzie czymś niczym "%s", funkcja printf będzie próbowała wyświetlić ciąg, który nie został podany jako parametr.

Czasami łańcuch trzeba interpretować nie jako ciąg znaków, ale jako np. liczbę. Jednak, aby dało się taką liczbę przetworzyć musimy użyć jednej z tych funkcji:

```
atol, strtol - char * -> long
atoi - char * -> int
atoll, strtoll - char * -> long long; istnieje także funckja atoq() - przestarzała, rozszerzenie GNU
atof, strtod - char * -> double, float
```

Funkcje `ato*` nie pozwalają na wykrycie błędów przy konwersji i  gdy jest to potrzebne, należy stosować funkcje strto*.

Czasami potrzeba też przekonwertować w drugą stronę - z liczby na łańcuch. Do tego celu służy sprintf() i snprintf(). Funkcja sprintf() jest bardzo podobna do printf(), ale wyniki jej prac zwracane są do pewnego ciągu, a nie zapisywane do strumienia. Należy jednak uważać przy jej użyciu (tak jak wcześniej w przypadku strcpy() i strncpy()). snprintf() dodatkowo przyjmuje jako argument wielkość bufora docelowego.
Operacje na znakach

Warto też powiedzieć w tym miejscu o operacjach na pojedynczych znakach. Przykład:

```
#include <stdio.h>
#include <ctype.h>
#include <string.h>

int main() {
    int c;
    while((c = getchar()) != EOF) { /* getchar() wczytuje pojedynczy znak */
        if(islower(c))
            c = toupper(c);
        else if(isupper(c))
            c = tolower(c);
        putchar(c);
    }
}
```

Program ten zmienia we wczytywanym tekście wielkie litery na małe i odwrotnie. W tym kodzie wykorzystywane są funkcje operujące na znakach z pliku nagłówkowego `ctype.h`. isupper() sprawdza, czy znak jest wielką literą, toupper() zmienia znak (o ile jest literą) na wielką literę. Analogicznie jest dla funkcji islower() i tolower().

Możesz tak zmodyfikować program, żeby odczytywał dane z pliku podanego jako argument lub wprowadzonego z klawiatury, jako ćwiczenie.

Częste błędy związane z ciągami:

 * Pisanie do niezaalokowanego miejsca
 ```
 const char *str;
 scanf("%s", str);
 ```
 * Zapominanie o nullu
```
char test[4] = "test"; /* null kończący napis nie zmieścił się */
```
 * Nieprawidłowe porównywanie
```
char str1[] = "jakis tekst";
char str2[] = "jakis tekst";
if(str1 == str2) { /* == porównuje adresy, należy użyć strcmp().  */
     /* Cośtam */
}
```

W dzisiejszych czasach brak obsługi wielu języków praktycznie dyskwalifikuje język. C99 wprowadza możliwość zapisu znaków wg norm Unicode.

Do przechowywania znaków zakodowanych w Unicode należy korzystać z typu wchar_t. Jego rozmiar jest zależny od używanego kompilatora, lecz w większości kompilatorów powinny to być 2 bajty. wchar_t jest częścią C++, w C znajduje się w pliku nagłówkowym stddef.h. Alternatywą jest wykorzystanie gotowych bibliotek (większość jest dostępnych jedynie dla C++ i nie współpracuje z C), które często definiują własne typy, konieczne jest przejście znanych już funkcji jak np. strcpy i strcmp na funkcje dostarczane przez bibliotekę. W tym podręczniku opiszę pierwsze wyjście.

Unicode określa tylko jakiej liczbie odpowiada jaki znak i nie mówi nic o sposobie dekodowania. Jako że Unicode obejmuje 918 tysięcy znaków, zmienna zdolna pomieścić go w całości musi mieć przynajmniej 3 bajty. Procesory nie funkcjonują na zmiennych o tym rozmiarze, a jedynie na zmiennych o wielkościach 1, 2, 4 oraz 8 bajtów (kolejne potęgi liczby 2). Dlatego też trzeba skorzystać ze zmiennej 4-bajtowej. UTF-32 po prostu przydziela każdemu znakowi Unicode kolejne liczby. Jest to najbardziej intuicyjne i wygodne kodowanie, ale ciągi zakodowane w nim są bardzo obszerne co zajmuje dostępną pamięć, spowalnia działanie aplikacji oraz pogarsza wydajność podczas transferu przez sieć. Poza UTF-32 które opisuję istnieje jeszcze wiele innych kodowań. Najpopularniejsze z nich to UTF-8 - od 1-6 bajtów (dla znaków poniżej 65536 do 3 bajtów) na znak, jest skrajnie niewygodny, gdy potrzebne jest przeprowadzanie operacji na tekście niekorzystając z gotowych funkcji,  UTF-16 - 2/4 bajty na znak, ręczne modyfikacje ciągu są bardziej skomplikowane niż przy UTF-32, UCS-2 - 2 bajty na znak, znaki z numerami powyżej 65535 nie są uwzględnione.

Ręczne operacje na ciągach UTF-8 i UTF-16 są trudne, ponieważ w przeciwieństwie do UTF-32, gdzie można określić, które bajty zajmuje który znak, w tych kodowaniach niezbędne jest wstępne określenie rozmiaru pierwszego znaku. Ponadto, gdy korzystamy z nich nie działają wtedy funkcje udostępniane przez biblioteki C do operowania na ciągach znaków.

| Priorytet | Kodowania |
|-----------|-----------|
| mały rozmiar | UTF-8 |
| łatwość w użytkowaniu | UTF-32, UCS-2 |
| przenośność | UTF-8 |
| wydajność | UCS-2, UTF-8 |

Aby zacząć korzystać z UCS-2, musisz "przerzucić się" na typ wchar_t, używać odpowiedników funkcji operujących na typie char pracujących na wchar_t (z reguły w nazwie zamienia się str->wcs np. strcpy-wcscpy, strcmp-wcscmp).

Przykład użycia UCS-2:

```
#include <stddef.h>
#include <stdio.h>
#include <string.h>

int main() {
    wchar_t* wcs1 = L"Ala ma kota, ";
    wchar_t* wcs2 = L"bo nie wzięła leków.";
    wchar_t wcs3[60];
  
    wcscpy(wcs3, wcs1);
    wcscat(wcs3, wcs2);
    printf("%ls\n", wcs3);
    return 0;
}
```

