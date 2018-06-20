
# C dla Początkującego

## Pierwszy program

Twój pierwszy program w C wyświetli na ekranie tekst "Hello, World!". W polu na kod źródłowy wpisz następującą treść:

```c

#include <stdio.h>

int main(void) {
    printf("Hello, world!");
    return 0;
}

```

![Screenshot](Screenshot_3.bmp "Screenshot")
Aby uruchomić nasz program, naciśnij F9. Najpierw jednak, zapisz plik gdziekolwiek jako `main.c`. Końcówka `.c` jest bardzo ważna!
Jeśli ukazało ci się okno konsoli z napisem "Hello, World!", środowisko którego używasz działa poprawnie.

## Podstawowe pojęcia

Dla właściwego zrozumienia języka C niezbędne jest przyswojenie pewnych ogólnych informacji.

Jak każdy język programowania, C sam w sobie jest niezrozumiały dla procesora. Został on stworzony w celu umożliwienia ludziom łatwego pisania kodu, który może zostać przetworzony na kod maszynowy.

Program, który zamienia kod C na wykonywalny kod binarny, to kompilator. Jeśli pracujesz nad projektem, który wymaga kilku plików kodu źródłowego (np. pliki nagłówkowe), wtedy jest uruchamiany kolejny program - linker. Linker służy do połączenia różnych plików i stworzenia jednej aplikacji lub biblioteki. Biblioteka jest zestawem procedur, który sam w sobie nie jest wykonywalny, ale może być używana przez inne programy. Kompilacja i łączenie plików są ze sobą bardzo ściśle powiązane, stąd są przez wielu traktowane jako jeden proces. 

Jedną rzecz warto sobie uświadomić - kompilacja jest jednokierunkowa: przekształcenie kodu źródłowego C w kod maszynowy jest bardzo proste, natomiast odwrotnie - nie. Dekompilatory co prawda istnieją, ale rzadko tworzą użyteczny kod C.

Najpopularniejszym wolnym kompilatorem jest prawdopodobnie GNU Compiler Collection.

Pewnie zaskoczy Cię to, że tak naprawdę język C bez bibliotek standardowych nie może zbyt wiele (wyjątkiem jest inline assembly, którego można użyć w połączeniu z przerwaniami, ale przeważnie nie robi się tego). Język C w grupie języków programowania wysokiego poziomu jest stosunkowo nisko.

Dzięki temu kod napisany w języku C można dość łatwo przetłumaczyć na kod asemblera. Bardzo łatwo jest też łączyć ze sobą kod napisany w języku asemblera z kodem napisanym w C. Dla bardzo wielu ludzi przeszkodą jest także dość duża liczba i częsta dwuznaczność operatorów.

Początkujący programista, czytający kod programu w C może odnieść bardzo nieprzyjemne wrażenie, które można opisać cytatem "ja nigdy tego nie opanuję". Wszystkie te elementy języka C, które wydają Ci się dziwne i nielogiczne w miarę, jak będziesz nabierał doświadczenia nagle okażą się całkiem przemyślanie dobrane i takie, a nie inne konstrukcje przypadną Ci do gustu. Dalsza lektura tego podręcznika oraz zaznajamianie się z funkcjami z różnych bibliotek ukażą Ci całą gamę możliwości, które daje język C doświadczonemu programiście. 

Jeśli miałeś styczność z językiem Pascal, to pewnie słyszałeś o nim, że jest to język programowania strukturalny. W C nie ma tak ścisłej struktury blokowej, mimo to jest bardzo ważne zrozumienie, co oznacza struktura blokowa. Blok jest grupą instrukcji, połączonych w ten sposób, że są traktowane jak jedna całość. W C, blok zawiera się pomiędzy nawiasami klamrowymi { }. Blok może także zawierać kolejne bloki.

Generalnie, blok zawiera ciąg kolejno wykonywanych poleceń. Polecenia zawsze (z nielicznymi wyjątkami) kończą się średnikiem (;). W jednej linii może znajdować się wiele poleceń, choć dla zwiększenia czytelności kodu najczęściej pisze się pojedynczą instrukcję w każdej linii. Jest kilka rodzajów poleceń, np. instrukcje przypisania, warunkowe czy pętli. W dużej części tej książki będziemy zajmować się właśnie instrukcjami. 

Pomiędzy poleceniami są również odstępy - spacje, tabulacje oraz przejścia do następnej linii, przy czym dla kompilatora te trzy rodzaje odstępów mają takie samo znaczenie. Ale uwaga, nie możemy łamać ciągów na kilka linii, tak po prostu!

```c
printf("Hello
world");
return 0;
```

Powyższy kod jest błędny. W C ważne jest samo istnienie odstępu, a nie typ / rozmiar.

Zasięg to pojęcie dotyczące zmiennych (które przechowują dane przetwarzane przez program). W większości programów są zarówno zmienne wykorzystywane przez cały czas działania programu oraz takie, które są używane przez pojedynczy blok programu (np. funkcję). Na przykład, w pewnym programie w pewnym momencie jest wykonywane skomplikowane obliczenie, które wymaga zadeklarowania wielu zmiennych do przechowywania pośrednich wyników. Ale przez większą część tego działania te zmienne są niepotrzebne i zajmują tylko miejsce w pamięci - najlepiej gdyby to miejsce zostało zarezerwowane tuż przed wykonaniem wspomnianych obliczeń, a zaraz po ich wykonaniu zwolnione. Dlatego w C istnieją zmienne globalne oraz lokalne. Zmienne globalne mogą być używane w każdym miejscu programu, natomiast lokalne - tylko w określonym bloku czy funkcji (oraz blokach w nim zawartych). Generalnie - zmienna zadeklarowana w danym bloku jest dostępna tylko wewnątrz niego.

Funkcje są ściśle związane ze strukturą blokową, funkcja to po prostu blok instrukcji, który jest potem wywoływany w programie za pomocą pojedynczego polecenia. Zazwyczaj funkcja wykonuje pewne określone zadanie, np. we wspomnianym programie wykonującym pewne skomplikowane obliczenie.

Każda funkcja ma swoją nazwę, za pomocą której jest potem wywoływana w programie, oraz blok wykonywanych poleceń. Wiele funkcji pobiera pewne dane, czyli argumenty funkcji, wiele funkcji także zwraca pewną wartość po zakończeniu wykonywania. Dobrym nawykiem jest dzielenie dużego programu na zestaw mniejszych funkcji - dzięki temu będziesz mógł łatwiej odnaleźć ewentualny błąd w programie oraz łatwiej rozwijać program.

Jeśli chcesz użyć jakiejś funkcji, to powinieneś wiedzieć jakie zadanie wykonuje dana funkcja, jaki jest rodzaj wczytywanych argumentów i do czego są one potrzebne tej funkcji i jaki jest rodzaj zwróconych danych i co one oznaczają.

W programach w języku C jedna funkcja ma szczególne znaczenie - jest to main(). Funkcję tę, zwaną funkcją główną, musi zawierać każdy program (wyjątek: biblioteka). W niej zawiera się główny kod programu i przekazywane są do niej argumenty, z którymi wywoływany jest program (jako parametry argc, argv i argp). Więcej o funkcji main() dowiesz się później. 

Język C, w przeciwieństwie do innych języków programowania (np. Fortrana czy Pascala), nie posiada żadnych słów kluczowych, które odpowiedzialne by były za obsługę wejścia i wyjścia. Może się to wydawać dziwne - język, który sam w sobie nie posiada podstawowych funkcji, musi być językiem o ograniczonym zastosowaniu. Jednak brak podstawowych funkcji wejścia-wyjścia jest jedną z największych zalet tego języka. Jego składnia opracowana jest tak, by można było bardzo łatwo przełożyć ją na kod maszynowy. To właśnie dzięki temu programy napisane w języku C są takie szybkie. 

W 1983 roku, kiedy zapoczątkowano prace nad standaryzacją C, zdecydowano, że powinien być zestaw instrukcji identycznych w każdej implementacji C. Nazwano je Biblioteką Standardową (czasem nazywaną "libc"). Zawiera ona podstawowe funkcje, które umożliwiają wykonywanie takich zadań jak wczytywanie i zwracanie danych, modyfikowanie zmiennych łańcuchowych, działania matematyczne, operacje na plikach i wiele innych, jednak nie zawiera żadnych funkcji, które mogą być zależne od systemu operacyjnego czy sprzętu, jak grafika, dźwięk czy obsługa sieci. W programie "Hello World" użyto funkcji z biblioteki standardowej - printf, która wyświetla na ekranie sformatowany tekst. 

Komentarze to tekst włączony do kodu źródłowego, który jest pomijany przez kompilator i służy jedynie dokumentacji. W języku C, komentarze zaczynają się od `/*` a kończą `*/`. Uwaga: Takich komentarzy nie można zagnieżdzać.

Komentarze mają duże znaczenie dla rozwijania oprogramowania, nie tylko dlatego że inni będą kiedyś potrzebowali przeczytać napisany przez ciebie kod źródłowy ale także możesz chcieć po dłuższym czasie powrócić do swojego programu i możesz zapomnieć, do czego służy dany blok kodu, albo dlaczego akurat użyłeś tego polecenia a nie innego. W chwili pisania programu, to może być dla ciebie oczywiste, ale po dłuższym czasie możesz mieć problemy ze zrozumieniem kodu. Jednak nie należy też wstawiać zbyt dużo komentarzy ponieważ wtedy kod może stać się jeszcze mniej czytelny - najlepiej komentować fragmenty, które nie są oczywiste dla programisty oraz te o szczególnym znaczeniu. Ale tego nauczysz się już w praktyce.

Styl pisania kodu jest o tyle ważny, że powinien on być czytelny i zrozumiały; po to w końcu wymyślono języki programowania wysokiego poziomu (w tym C), aby kod było łatwo zrozumieć. Należy stosować wcięcia dla odróżnienia bloków kolejnego poziomu (zawartych w innym bloku; podrzędnych), nawiasy klamrowe otwierające i zamykające blok powinny mieć takie same wcięcia, staraj się, aby nazwy funkcji i zmiennych kojarzyły się z zadaniem, jakie dana funkcja czy zmienna pełni w programie. W dalszej części książki możesz napotkać więcej porad dotyczących stylu pisania kodu. Staraj się stosować do nich, dzięki temu pisany przez ciebie kod będzie łatwiejszy do czytania i zrozumienia. 

Jak już wcześniej było wspomniane, zmiennym i funkcjom powinno się nadawać nazwy, które odpowiadają ich znaczeniu. Zdecydowanie łatwiej jest czytać kod, gdy średnią liczb przechowuje zmienna srednia niż a, a znajdowaniem maksimum w ciągu liczb zajmuje się funkcja max albo znajdz_max niż nazwana f. Często nazwy funkcji to właśnie czasowniki.

W jakim języku należy pisać nazwy? Jeśli chcemy, by nasz kod mogły czytać osoby nieznające polskiego - warto użyć języka angielskiego. Bardzo istotne jest jednak, by nie mieszać języków. Przeplatanie ze sobą dwóch języków robi złe wrażenie.

Warto również zdecydować się na sposób zapisywania nazw składających się z więcej niż jednego słowa. Istnieje kilka możliwości, najważniejsze z nich to oddzielanie podkreśleniem: `int_to_str`,  "konwencja pascalowska", każde słowo dużą literą: `IntToStr`, "konwencja wielbłądzia", pierwsze słowo małą, kolejne dużą literą: `intToStr` lub łączenie słów i stosowanie skrótów: `itos`

Ponownie, najlepiej stosować konsekwentnie jedną z konwencji i nie mieszać ze sobą kilku.

Możesz też napotkać na swojej drodze notację węgierską, którą Ci odradzam - aktualnie, środowiska programistyczne podpowiedzą ci, jakiego typu jest zmienna.

Nie cały kod będzie zamieniany przez kompilator bezpośrednio na kod wykonywalny programu. W wielu przypadkach będziesz używać tzw. dyrektyw kompilacyjnych. Na początku procesu kompilacji, specjalny podprogram, tzw. preprocesor, wyszukuje wszystkie dyrektywy kompilacyjne i wykonuje odpowiednie akcje - które polegają na edycji kodu źródłowego (np. wstawieniu deklaracji funkcji, zamianie jednego ciągu znaków na inny). Właściwy kompilator, zamieniający kod C na kod wykonywalny, nie napotka już dyrektyw kompilacyjnych, ponieważ zostały one przez preprocesor usunięte, po wykonaniu odpowiednich akcji.

W C dyrektywy kompilacyjne zaczynają się od płotka (#). Przykładem najczęściej używanej dyrektywy, jest `#include`, która jest użyta nawet w tak prostym programie jak "Hello, World!". `#include` nakazuje preprocesorowi włączyć (ang. include) w tym miejscu zawartość podanego pliku, tzw. pliku nagłówkowego; najczęściej to będzie plik zawierający funkcje z którejś biblioteki standardowej (`stdio.h` - STandard Input & Output, rozszerzenie .h oznacza plik nagłówkowy C).

Nazwy zmiennych, stałych i funkcji mogą składać się z liter (bez polskich znaków), cyfr i znaku podkreślenia z tym, że nazwa taka nie może zaczynać się od cyfry. Nie można używać nazw zarezerwowanych przez język.

Konwencje nazewnictwa w C są dość proste.
Nazwy zmiennych piszemy małymi literami: `idx`, `file`.
Nazwy stałych (zadeklarowanych przy pomocy `#define`, lub zmiennych z modyfikatorem `const`) piszemy wielkimi literami: `SIZE`, `VERSION`.
Nazwy funkcji piszemy małymi literami: `print`, `sum`, `max`.

## Zmienne

Zmienna z definicji to pewien fragment pamięci o ustalonym rozmiarze, który posiada identyfikator oraz przechowuje pewną wartość, zależną od typu zmiennej.

Aby móc skorzystać ze zmiennej należy ją przed użyciem zadeklarować, to znaczy poinformować kompilator, jak zmienna będzie się nazywać i jaki typ ma mieć. **Uwaga: Jeśli typ zmiennej to int, i jest to zmienna globalna, możemy pominąć 'int'.** Przykład:

```c
int a;
```

Podczas deklaracji możemy też przypisać zmiennej wartość:

```c
int a = 42;
```

**W języku C zmienne deklaruje się na samym początku bloku (czyli przed pierwszą instrukcją).**

Niepoprawnie:

```c
{
   int a = 17;
   printf("%d", a);
   int b; /*Deklaracja po instrukcji, błąd!*/
   b = a;
}
```

Poprawnie:

```c
{
   int a = 17, b;
   printf("%d", a);
   b = a;
}
```

Zmienne tego samego typu można deklarować po przecinku. `int x, y;` == `int x; int y;`
**W C, nie są inicjalizowane zmienne lokalne. Oznacza to, że w nowo zadeklarowanej zmiennej znajdują się śmieci - to, co wcześniej zawierał przydzielony zmiennej fragment pamięci. Aby uniknąć błędów, dobrze jest inicjalizować wszystkie zmienne w momencie zadeklarowania.**

Zasady nazywania zmiennych:
 * Pierwszy znak : litera lub _
 * Zakaz używania słów kluczowych (już są użyte). Po zmianie wielkości liter jednak będą dopuszczalne
 * Wielkość liter odróżnia nazwy, `odleglosc` i `Odleglosc` to dwie różne zmienne
 * Długość nazwy - niektóre kompilatory pozwalają na użycie do 247 znaków
Przykłady niedopuszczalnych nazw:
```c
1x  //zaczyna się od cyfry
x+y //znak specjalny
char //słowo kluczowe
dodaj dwie liczby //spacje
```

Zmienne mogą być dostępne dla wszystkich funkcji programu - nazywamy je wtedy zmiennymi globalnymi. **Jeśli funkcja zwraca wartość int, możemy ominąć 'int'!**

```c
a,b;

void f(void) {
    a=3;
}
 
main(void) {
    b=3;
    a=2;
    return 0;
}
```

Uwaga: Zmienne globalne są domyślnie inicjalizowane zerem.

Zmienne, które funkcja deklaruje w swoim bloku nazywamy zmiennymi lokalnymi. Czy będzie błędem nazwanie tą samą nazwą zmiennej globalnej i lokalnej?. Nie. W danej funkcji da się używać tylko jej zmiennej lokalnej. Tej konstrukcji należy z wiadomych względów unikać.

```c
a = 1; 

main(void) {
    int a=2;
    printf("%d", a); /* =2 */
}
```

Czas życia zmiennych ilustruje poniższy przykład:

```c
main() {
 int a = 10;
 {
   int b = 10;
   printf("%d %d", a, b);
 }

 printf("%d %d", a, b);       /* Błąd, b już nie istnieje! */
}
```

Stała różni się od zmiennej tylko tym, że nie można jej przypisać innej wartości w trakcie działania programu. Wartość stałej ustala się w kodzie programu i nigdy ona nie ulega zmianie. Stałą deklaruje się z użyciem słowa kluczowego const w sposób następujący:

```
const typ nazwa_stałej=wartość;
```

Dobrze jest używać stałych w programie, ponieważ unikniemy wtedy pomyłek a kompilator może często zoptymalizować ich użycie (np. od razu podstawiając ich wartość do kodu).

```
const int START=5;
int i=START;
START=4;  /* Błąd. */
int j=START;
```

Dla komputera każdy obszar w pamięci jest taki sam - to zlepek bajtów, w takiej postaci zupełnie nieprzydatny dla programisty i użytkownika. Podczas pisania programu musimy wskazać, w jaki sposób ten ciąg ma być interpretowany.

Typ zmiennej wskazuje właśnie sposób, w jaki pamięć, w której znajduje się zmienna będzie wykorzystywana. Określając go przekazuje się kompilatorowi informację, ile pamięci trzeba zarezerwować dla zmiennej, a także w jaki sposób wykonywać na niej operacje.

Każda zmienna musi mieć określony swój typ w miejscu deklaracji i tego typu nie może już zmienić. Lecz co jeśli mamy zmienną jednego typu, ale potrzebujemy w pewnym miejscu programu innego typu danych? W takim wypadku stosujemy konwersję (rzutowanie) jednej zmiennej na inną zmienną. Rzutowanie zostanie opisane później, w następnym podrozdziale.

W języku C wyróżniamy następujące typy zmiennych (wg rozmiaru):

 * podstawowe:
   * char - jednobajtowe liczby całkowite;
   * int - typ całkowity o długości domyślnej dla danej architektury komputera (przeważnie 4 bajty);
   * float - typ zmiennoprzecinkowy, reprezentujący liczby rzeczywiste (4 bajty); Są dokładnie opisane w IEEE 754.
   * double - typ zmiennopozycyjny podwójnej precyzji (8 bajtów);
 * inne: typy złożone


Wg lokalizacji definicji typy dzielimy na wbudowane, które zna kompilator; oraz zdefiniowane przez użytkownika typy danych, które należy kompilatorowi opisać.

* int - typ przeznaczony jest do liczb całkowitych. Liczby te możemy zapisać na kilka sposobów, dziesiętnie: `12,42,15`, oktalnie: `044, 031` i heksadecymalnie: `0xFF, 0x1A, 0x80`.

* float - przeznaczony jest do liczb zmiennoprzecinkowych. Istnieją dwa sposoby zapisu, dziesiętny: `3.14, 1.72` i wykładniczy: `8e3, 9.2e-4`

* double ("podwójny") - przeznaczony dla liczb zmiennoprzecinkowych podwójnej precyzji. Oznacza to, że liczba zajmuje zazwyczaj w dwa razy więcej pamięci niż float, ale ma też dwa razy lepszą dokładność. Domyślnie ułamki wpisane w kodzie są typu double. Możemy to zmienić dodając na końcu literę "f":

```c
1.5f /* <-- float */
1.5  /* <-- double */
```

* char - typ znakowy umożliwiający zapis znaków w ASCII. Może być traktowany jako liczba z zakresu 0 do 255. Znaki zapisujemy w pojedynczych cudzysłowach, by odróżnić je od łańcuchów tekstowych. Przykład:   `'x'. '#'. ']'`. Pojedynczy cudzysłów zapisujemy jako '\'' a null (czyli zero, które kończy napisy) jako '\0' lub 0.

* void - można go używać tam, gdzie oczekiwana jest nazwa typu. void nie jest właściwym typem, bo nie można utworzyć zmiennej takiego typu; jest to "pusty" typ (ang. void = "pusty"). Typ void przydaje się do zaznaczania, że funkcja nie zwraca żadnej wartości lub że nie przyjmuje żadnych parametrów (więcej o tym później). Można też tworzyć zmienne typu "wskaźnik na void" 

* size_t - to typ zdefiniowany w nagłówku `stddef.h`, jako alias do liczby całkowitej bez znaku. Użycie size_t może poprawić przenośność i czytelność kodu. Czym dokładnie jest size_t? Sprawdźmy to:

```sh
$ echo | gcc -E -xc -include 'stddef.h' - | grep size_t #=> typedef unsigned int size_t;
```

Specyfikatory to takie słowa kluczowe, które zmieniają znaczenie typu danych.

Jak komputer może przechować liczbę ujemną. W przypadku przechowywania liczb ujemnych musimy w zmiennej przechować jeszcze jej znak. Jak wiadomo, zmienna składa się z szeregu bitów. W przypadku użycia zmiennej pierwszy bit z lewej strony (nazywany także bitem najbardziej znaczącym) przechowuje znak liczby. Efektem tego jest spadek "pojemności" zmiennej, czyli zmniejszenie największej wartości, którą możemy przechować w zmiennej.

Signed oznacza liczbę ze znakiem, unsigned - bez znaku (nieujemną). Mogą być zastosowane do typów: char i int i łączone ze specyfikatorami short i long (gdy ma to sens).

```c
signed char a;      /* -128 do 127 */
unsigned char b;    /* 0 do 255    */
```

Jeśli przy signed lub unsigned nie podamy typu, kompilator przyjmie wartość domyślną - int. 
Jeżeli nie podamy żadnego ze specyfikatora wtedy liczba jest domyślnie przyjmowana jako signed (uwaga: nie dotyczy `char`!).
Liczby bez znaku pozwalają nam zapisać większe liczby przy tej samej wielkości zmiennej - ale trzeba uważać, by nie zejść z nimi poniżej zera - wtedy "przewijają" się na sam koniec zakresu, co może powodować błędy w programach. 

Short i long są wskazówkami dla kompilatora, by zarezerwował dla danego typu mniej (lub więcej) pamięci. Mogą być zastosowane do dwóch typów: int i double (tu tylko long), mając różne znaczenie.
Jeśli przy short lub long nie napiszemy, o jaki typ nam chodzi, kompilator przyjmie domyślny typ - int.
Należy pamiętać, że to jedynie życzenie wobec kompilatora - w niektórych kompilatorach typy int i long int mają ten sam rozmiar. Standard języka C nakłada jedynie na kompilatory następujące ograniczenia:

int:
    > 16 bitów
    >= short
    < long;
    
short int: > 16 bitów;
long int: > 32 bity;

`volatile` (ang. ulotny) - kompilator wyłączy dla takiej zmiennej różne optymalizacje, za to wygeneruje kod, który będzie odwoływał się zawsze do komórek pamięci danego obiektu. Zapobiegnie to błędowi, gdy obiekt zostaje zmieniony przez część programu, która nie ma zauważalnego dla kompilatora związku z danym fragmentem kodu lub nawet przez zupełnie inny proces. Modyfikator `volatile` jest rzadko stosowany i przydaje się w wąskich zastosowaniach, jak współbieżność, współdzielenie zasobów i przerwania systemowe.

Zmienna, której będziemy używać w swoim programie bardzo często, może mieć nadany modyfikator `register`. Kompilator może wtedy umieści zmienną w rejestrze, do którego ma szybki dostęp, co przyśpieszy odwołania do tej zmiennej. Nie mamy żadnej gwarancji, że zmienna tak zadeklarowana rzeczywiście się tam znajdzie, chociaż dostęp do niej może zostać przyspieszony w inny sposób.

`static` pozwala na zdefiniowanie zmiennej statycznej. Statyczność polega na zachowaniu wartości pomiędzy kolejnymi definicjami tej samej zmiennej. Jest to przydatne w funkcjach. Gdy zdefiniujemy zmienną w ciele funkcji, to zmienna ta będzie od nowa definiowana wraz z domyślną wartością (jeżeli taką podano). W wypadku zmiennej określonej jako statyczna, jej wartość się nie zmieni przy ponownym wywołaniu funkcji.

`extern` oznacza zmienne globalne zadeklarowane w innych jednostkach - informujemy kompilator, żeby nie szukał jej w aktualnym pliku.

## Operatory

W języku C wyróżniamy następujące operatory:
 * **Przypisania**, przypisuje wartośc prawego argumentu lewemu. Np: `int a = 42, b; b = a;`. Tego operatora można użyć kaskadowo, np: `int a, b, c; a = b = c = 84;`
 * **a #= b (#: `+, -, *, /, %, &, |, ^, <<, >>` => `a = a # (b)`)**, to skrócony zapis różnych operatorów. Przykład:
 
```c
int a = 1; a += 9;     /* a = a + 9; */
a *= a + 6; /* a = a * (a + 6); */
a %= 2;     /* a = a % 2; */
```

 * **Rzutowanie niejawne**, polega na zamianie jednego typu na inny bez wyraźnej deklaracji w kodzie. Przykład:
 
```c
int i = 42.7;            /* double -> int */
float f = i;             /* int -> float */
double d = f;            /* float -> double */
unsigned u = i;          /* int -> unsigned int */
f = 4.2;                 /* double -> float */
i = d;                   /* double -> int */
char *str = "foo";       /* const char* -> char* (const x -> x nie jest dopuszczalne, ale ciągi stanowią wyjątek) */
const char *cstr = str;  /* char* -> const char* */
void *ptr = str;         /* char* -> void* */
```

* **Rzutowanie jawne**, to zamiana z jednego typu na inny z wyraźną deklaracją w kodzie. Przykład:

```c
float d = 3.14; /* rzutowanie niejawne, double -> float */
int pi = (int)d; /* rzutowanie jawne, float -> int */
pi = (unsigned)pi * 2; /* rzutowanie jawne, signed -> unsigned */
```
 
 * **Artmetyczne**. **Uwaga**: W arytmetyce komputerowej nie działa prawo łączności oraz rozdzielności. Wynika to z ograniczonego rozmiaru zmiennych, które przechowują wartości. C definiuje następujące operatory arytmetyczne:
  * dodawanie ("`+`"),
  * odejmowanie ("`-`"),
  * mnożenie ("`*`"),
  * dzielenie ("`/`"),
  * modulo ("`%`") określone tylko dla liczb całkowitych.
  
  Przykłady:
```c
int a=7, b=2;
printf ("%d\n", a % b); /* => 1 */

float a = 7 / 2;
printf("%f\n", a); /* => 3, Wynik operacji jest takiego typu, jak największy z argumentów. Oznacza to, że operacja wykonana na dwóch liczbach całkowitych nadal ma typ całkowity nawet jeżeli wynik przypiszemy do zmiennej rzeczywistej.*/
```
  
 * **Operatory dodawania i odejmowania** są określone również, gdy jednym z argumentów jest wskaźnik, a drugim liczba całkowita. Ten drugi jest także określony, gdy oba argumenty są wskaźnikami. Aby skrócić zapis wprowadzono dodatkowe operatory: inkrementacji ("++") i dekrementacji ("--"), które dodatkowo mogą być pre- lub postfiksowe:
 
 ```c
 int a, b, c;
 a = 3;
 b = a--; /* b=3 a=2 */
 c = --b; /* b=2 c=2 */
 c = b++; /* b=3 c=2 */
 a = ++b; /* b=4 c=4 */
 ```
 
Czasami użycie operatorów postfiksowych jest nieco mniej efektywne (kompilator musi stworzyć zmienną tymczasową).
 * Oprócz podstawowych operacji matematycznych, język C został wyposażony także w **operatory bitowe**, zdefiniowane dla liczb całkowitych. Są to:

  * negacja bitowa (NOT)("~"),
  * koniunkcja bitowa (AND)("&"),
  * alternatywa bitowa (OR)("|") i
  * alternatywa rozłączna (XOR) ("^").

Działają one na poszczególnych bitach przez co mogą być szybsze od innych operacji. Działanie tych operatorów można zdefiniować za pomocą poniższych tabel:

```
 "~" | a     "&" | a | b     "|" | a | b     "^" | a | b
-----+---   -----+---+---   -----+---+---   -----+---+---
  0  | 1      0  | 0 | 0      0  | 0 | 0      0  | 0 | 0
  1  | 0      0  | 1 | 0      1  | 1 | 0      1  | 1 | 0
              0  | 0 | 1      1  | 0 | 1      1  | 0 | 1
              1  | 1 | 1      1  | 1 | 1      0  | 1 | 1
```
 * **Przesunięcie bitowe** operatory te przesuwają one w danym kierunku bity lewego argumentu o liczbę pozycji podaną jako prawy argument:
 
```c
   a  | a<<1 | a<<2 | a>>1 | a>>2
------+------+------+------+------
 0001 | 0010 | 0100 | 0000 | 0000
 0011 | 0110 | 1100 | 0001 | 0000
 0101 | 1010 | 0100 | 0010 | 0001
 1000 | 0000 | 0000 | 1100 | 1110
 1111 | 1110 | 1100 | 1111 | 1111
 1001 | 0010 | 0100 | 1100 | 1110
```

```c
#include <stdio.h>

main(void) {
    printf("6<<2=%d\n", 6<<2);  /* => 24 */
    printf("6>>2=%d\n", 6>>2);  /* => 1 */
    return 0;
}
```

 * **Operatory porównania**. W C występują następujące operatory porównania:
    * równe ("=="),
    * różne ("!="),
    * mniejsze ("<"),
    * większe (">"),
    * mniejsze lub równe ("<="),
    * większe lub równe (">=").

Wykonują one odpowiednie porównanie swoich argumentów i zwracają jedynkę jeżeli warunek jest spełniony lub zero jeżeli nie jest.

```c
#include <stdio.h>
int main(void) {
    if (2 == 3)
        printf("Rowne\n");
    else
        printf("Nie rowne\n");
    return 0;
}
```

 * **Operatory logiczne**. Analogicznie do części operatorów bitowych, definiuje się operatory logiczne takie jak:
   * negację: `!`
   * koniunkcję: `&&`
   * alternatywę: `||`

Działają one bardzo podobnie do operatorów bitowych, jednak zamiast operować na poszczególnych bitach, biorą pod uwagę wartość logiczną argumentów.

W przypadku operatorów logicznych nie używamy specjalnego typu danych do operacji logicznych. Można je stosować do liczb (np. typu int), tak samo jak operatory bitowe albo arytmetyczne. Operatory logiczne w wyniku dają zawsze albo 0 albo 1. 

 * **Operator wyrażenia warunkowego** to operator ?:. Jest to jedyny operator w tym języku przyjmujący trzy argumenty.

```c
a ? b : c
```

Jego działanie wygląda następująco: najpierw oceniana jest wartość logiczna wyrażenia a; jeśli jest ono prawdziwe, to zwracana jest wartość b, jeśli natomiast wyrażenie a jest nieprawdziwe, zwracana jest wartość c.

Praktyczne zastosowanie - znajdowanie większej z dwóch liczb:

```c
a = (b>=c) ? b : c;     /* Jeśli b jest większe bądź równe c, to zwróć b. 
                           W przeciwnym wypadku zwróć c. */
```

Wartości wyrażeń są przy tym operatorze obliczane tylko jeżeli zachodzi taka potrzeba, np. w wyrażeniu `1 ? 1 : f()` funkcja f() nie zostanie wywołana. 

 * **Operator przecinka** powoduje on obliczanie wartości wyrażeń od lewej do prawej po czym zwrócenie wartości ostatniego wyrażenia. W zasadzie, w normalnym kodzie programu ma on niewielkie zastosowanie, gdyż zamiast niego lepiej rozdzielać instrukcje zwykłymi średnikami. Używa się go jednak w instrukcji sterującej for. 

 * **Operator sizeof** zwraca rozmiar w bajtach podanego typu lub podanego wyrażenia. Ma on dwa rodzaje: `sizeof(typ)` i `sizeof wyrazenie`. Przykładowo:
 
 ```c
 printf("sizeof(int) = %d", sizeof(int));
 ```
 
 Operator ten jest często wykorzystywany przy dynamicznej alokacji pamięci, co zostanie opisane w rozdziale poświęconym wskaźnikom.

Pomimo, że w swej budowie sizeof przypomina funkcję, to jednak nią nie jest. Wynika to z trudności w implementacji takowej funkcji - jej specyfika musiałaby odnosić się bezpośrednio do kompilatora. Ponadto jej argumentem musiałby być typ, a nie zmiennq. W C nie jest możliwe przekazywanie typu jako argumentu. Często zdarza się, że rozmiar zmiennej musi być wiadomy jeszcze w czasie kompilacji - to ewidentnie wyklucza implementację sizeof() jako funkcji. Wynikiem operatora sizeof jest zmienna typu size_t.

 * **Inne operatory**:
  * operator `[]` - później opisany przy tablicach;
  * jednoargumentowe operatory `*` i `&` później opisane przy wskaźnikach;
  * operatory `.` i `->` później opisane przy strukturach;
  * operator `()` - wywołania funkcji,
  * operator `()` grupujący wyrażenia.

Priorytet operatorów:

```
1. nawiasy
2. jednoargumentowe przyrostkowe: [] . -> wywołanie funkcji postinkrementacja postdekrementacja
3. jednoargumentowe przedrostkowe: ! ~ + - * & sizeof preinkrementacja predekrementacja rzutowanie
4. * / %
5. + -
6. << >>
7. < <= > >=
8. == !=
9. &
10. ^
11. |
12. &&
13. ||
14. ?:
15. operatory przypisania
16. ,
```
