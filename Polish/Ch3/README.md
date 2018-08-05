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
