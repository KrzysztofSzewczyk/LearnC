# Wstęp

## Czemu warto uczyć się C?

Język C został stworzony do pisania systemów operacyjnych. Jednak z czasem, C znalazło swoje miejsce praktycznie wszędzie - od Internetu (Emscripten) po mikrokontrolery (AVR-GCC) aż do aplikacji desktopowych i systemów operacyjnych. C jest bardzo uniwersalnym językiem.

Wbrew pozorom, C++ **nie** jest rozszerzeniem do C, lecz oddzielnym językiem który "wyrósł" z języka C. Obecnie, chociażby używanie funkcji z biblioteki standardowej C w C++ nie jest zalecane, tak samo jak np. manipulacja surowymi wskaźnikami (raw pointers).

C mimo swojego wieku nadal szczyci się tytułem "lingua franca" w programowaniu. Większość algorytmów jest przedstawiana właśnie w C (po czym mistrzowie pythona chcą to przetłumaczyć na swój język, i zaliczają solidny upadek pytając się o podstawy tego języka).

W momencie w którym to piszę, C jest drugim najpopularniejszym językiem który jest w użytku zdaniem [TIOBE index](https://www.tiobe.com/tiobe-index/), tuż za Javą. Popularność C ciągle rośnie w ogromnym tempie (w momencie pisania 8% zmiany rocznie, Java ma 0,4% więcej udziału od C). Tuż za C znajduje się C++, Python, C#.

W tej książce przedstawię również język Assemblera który nie jest już tak popularny (16 miejsce w rankingu, dwa miejsca przed Go), mimo to jest to wspaniały język do tworzenia niezwykle wydajnych aplikacji. [Ten](speed.asm) plik zawierający źródło assemblera osiągający na mojej maszynie **13,7** GFLOPS, czyli **13 700 000 000 operacji zmiennoprzecinkowych na sekundę**.

**UWAGA:** Jeśli zechcesz uruchomić ten program, podkręć sobie chłodzenie i co chwilę sprawdzaj temperaturę procesora. Może on wyrządzić szkody (np. spalić procesor); ten program może nie funkcjonować out of the box, ale jego zasada działania jest bardzo łatwo zauważalna i można w różne sposoby udowodnić rzeczywistą prędkość zastosowanej metody.

Mam nadzieję, że udało mi się Ciebie zachęcić do nauki C oraz Assemblera. Są to dwa wspaniałe języki które musisz poznać, jeśli chcesz rozpocząć swoją karierę programisty w prawidłowy sposób.

## O języku

Z definicji, C to imperatywny, strukturalny język programowania wysokiego poziomu stworzony na początku '70 przez Dennisa Ritchiego do programowania systemów operacyjnych i innych zadań niskiego poziomu.

Poprzednikiem C był język B, który Ritchie rozwinął. Pierwszy okres rozwoju języka to lata 1969–1973. W roku 1973 w C udało się zaimplementować jądro systemu operacyjnego Unix. W 1978 roku Brian Kernighan i Dennis Ritchie opublikowali dokumentację języka pt. C Programming Language (wydanie polskie: Język C). Wersję języka opisywaną w ich książce nazwano "K&R C", i uznano ją za minimalne wymaganie, które spełnia każda maszyna - jeśli jakaś platforma wspiera C, z pewnością wspiera K&R C.

W 1983 roku ANSI powołało komitet X3J11 w celu ustanowienia standardu języka C. Standard został zatwierdzony w 1989 roku jako ANSI X3.159-1989 "Programming Language C". Ta wersja języka jest określana nieformalnie jako ANSI C, standardowe C lub C89. Jest to najczęściej używany standard C.

1990 roku standard ANSI C został zaadoptowany przez ISO jako norma ISO/IEC 9899:1990. Ta wersja jest potocznie nazywana C90. Ponieważ normy wydane przez oba ciała standaryzacyjne są identyczne, wobec tego potoczne określenia C89 oraz C90 dotyczą tej samej wersji języka C. W 1999 roku ISO opublikowało normę ISO/IEC 9899:1999, język zgodny z tą normą jest nieformalnie nazywany C99. Ostatnia norma została opublikowana w 2011 roku pod nazwą ISO/IEC 9899:2011. Ta wersja języka jest potocznie nazywana C11 (C1X przed opublikowaniem normy). C90, C99 i C11 nie są tak często używane.

C posiada 13 typów podstawowych i 32 słowa kluczowye (C89) - jest to bardzo prosty język.

## Jak używać kompilatora?

Uwaga: Zakładam że masz średnio rozbudowaną wiedzę informatyczną (tj. taką, która pozwala np. na korzystanie z powłoki)
Pierwszym krokiem będzie pobranie edytora - Notepad++ (Windows), lub Vim, Emacs lub PTE (UNIXopodobne).

Jeśli jesteś użytkownikiem systemu unixopodobnego, zakładam że posiadasz zainstalowane GCC.
Jako użytkownik Windowsa powinieneś pobrać MinGW a następnie dodać ścieżkę z plikami wykonywalnymi GCC do PATH.

Aby skompilować plik .c do postaci pliku wykonywalnego, należy uruchomić kompilator:

```sh
gcc main.c -o main
```

To polecenie stworzy plik `main.exe` (Windows) lub `main` (UNIX)

**[Powrót do spisu treści](..)**
