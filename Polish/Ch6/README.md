
# Biblioteka standardowa C

W tym rozdziale omówię funkcje biblioteki standardowej C.

## assert.h

### assert

**Typ**: Makro

**Prototyp**: `void assert (int expression);`

**Opis**:

Assert wykonuje wyrażenie i przyrównuje je do zera (sprawdza, czy jest fałszywe). Jeśli jest, na `stdout` wypisana zostaje informacja o błędzie. Tuż po tym, `assert()` wykonuje funkcję `abort()`, kończąc wykonywanie programu. Wyświetlona wiadomość może różnić się pomiędzy implementacjami biblioteki standardowej. Makro jest wyłączone jeśli przed jego dołączeniem `NDEBUG` zostało już zdefiniowane. To pomaga w usunięciu wywołań assert w kodzie, jeśli debugowanie jest wyłączone. Przykład:

```
#define NDEBUG 
```

przed dołączeniem czegokolwiek.
To makro wykrywa błędy w programie, a nie błędy użytkownika lub błędy w czasie uruchamiania, ponieważ jeśli debugowanie jest wyłączone, makro nie działa.

**Wartość zwracana**: brak

**Argumenty**:
 * `expression` - wyrażenie którego wartość ma zostać sprawdzona.

**Przykład użycia**:

```
#include <stdio.h>
#include <assert.h>

void print(int * num) {
    assert(num != NULL);
    printf("%d\n", *num);
}

int main () {
    int a=10, * b = NULL, * c = NULL;
    b=&a;
    
    print(b);
    print(c);
}
```
