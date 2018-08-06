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

