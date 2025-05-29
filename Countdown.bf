,            // Lee el carácter de entrada (ej. '7', ASCII 55) en la celda 0. Puntero en celda 0.

// Parte 1: Convertir el carácter ASCII del dígito a su valor numérico.
// ASCII '0' es 48. Si el usuario ingresa '7' (ASCII 55), queremos 55 - 48 = 7.
// Almacenaremos el valor numérico N en la celda 0.
// Almacenaremos el valor ASCII de '0' (48) en la celda 1 para usarlo al imprimir.

> ++++++++   // Mueve a la celda 1. Celda 1 = 8 (contador temporal para la resta). Puntero en celda 1.
[ <------ >- ] // Bucle: Resta 6 de la celda 0 (total 6*8=48). Decrementa celda 1.
             // Al final: Celda 0 = N (valor numérico del dígito). Celda 1 = 0. Puntero en celda 1.

// Ahora Celda 0 = N. Celda 1 = 0. Puntero en celda 1.
// Necesitamos poner 48 (ASCII '0') en la celda 1.
++++++++++++++++++++++++++++++++++++++++++++++++ // Celda 1 = 48. Puntero en celda 1.

// Estado actual:
// Celda 0: N (ej. 7 si se ingresó '7')
// Celda 1: 48 (ASCII de '0')
// Celda 2: 0 (se usará como buffer de impresión)
// Celda 3: 0 (se usará como temporal para copias no destructivas)
// Puntero en Celda 1.

// Parte 2: El bucle de cuenta atrás e impresión.
// Queremos imprimir N, N-1, ..., 1, 0. Esto son N+1 iteraciones.
<    // Mueve el puntero a la celda 0 (que contiene N).
+    // Incrementa la celda 0. Ahora Celda 0 = N+1. Este será nuestro contador de bucle (V).
[    // Inicio del bucle principal. Se ejecutará V veces. Puntero en Celda 0.
     // En cada iteración, V irá de N+1, N, ..., hasta 1.
     // El dígito que queremos imprimir es (V-1).
     // El carácter ASCII a imprimir es (V-1) + 48 (que está en Celda 1).

    // Usaremos Celda 2 como buffer de impresión y Celda 3 como temporal para copias.
    // Objetivo: Celda 2 = (Contador_actual_en_C0 - 1) + Valor_en_C1

    // Paso A: Copiar el valor de Celda 1 (48) a Celda 2, preservando Celda 1.
    // C0=V, C1=48, C2=0, C3=0. Puntero en C0.
    > // Mueve a Celda 1 (48).
    [->+>+<<] // Mueve el valor de C1 a C2 y C3. C1 se vuelve 0.
              // Estado: C0=V, C1=0, C2=48, C3=48. Puntero en C1.
    >> // Mueve a Celda 3 (48).
    [<<+>>-] // Mueve el valor de C3 de nuevo a C1. C3 se vuelve 0.
              // Estado: C0=V, C1=48, C2=48, C3=0. Puntero en C3.
    < // Mueve a Celda 2 (que ahora tiene 48).

    // Paso B: Sumar el valor del contador actual (V, en Celda 0) a Celda 2, preservando Celda 0.
    // Celda 2 ya tiene 48. Queremos Celda 2 = 48 + V.
    // Estado: C0=V, C1=48, C2=48, C3=0. Puntero en C2.
    << // Mueve a Celda 0 (V).
    [->>+>+<<<] // Mueve el valor de C0 a C2 (sumando) y a C3. C0 se vuelve 0.
                 // Estado: C0=0, C1=48, C2=48+V, C3=V. Puntero en C0.
    >>> // Mueve a Celda 3 (V).
    [<<<+>>>-] // Mueve el valor de C3 de nuevo a C0. C3 se vuelve 0.
                 // Estado: C0=V, C1=48, C2=48+V, C3=0. Puntero en C3.
    < // Mueve a Celda 2 (que ahora tiene 48+V).

    // Paso C: Ajustar y Imprimir.
    // Celda 2 tiene (48+V). El dígito a imprimir es (V-1).
    // Entonces, el carácter ASCII es (V-1)+48.
    // Actualmente Celda 2 = V+48. Restamos 1 para obtener (V-1)+48.
    - // Celda 2 = (V-1) + 48. Este es el carácter ASCII correcto.
    . // Imprime el carácter en Celda 2.

    // Paso D: Limpiar Celda 2 para la siguiente iteración.
    [-] // Pone Celda 2 a 0.

    // Paso E: Decrementar el contador del bucle principal (en Celda 0).
    // Puntero está en Celda 2. Mover a Celda 0.
    << // Mueve a Celda 0 (V).
    -  // Decrementa Celda 0 (V--).
]    // Fin del bucle principal. Si Celda 0 es 0, el bucle termina.
