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
