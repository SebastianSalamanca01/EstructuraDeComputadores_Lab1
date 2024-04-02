.data
    num: .asciiz "Ingrese la cantidad de números en la serie de Fibonacci: "  # Define una cadena de texto para solicitar la cantidad de números al usuario
    fib: .asciiz "Serie de Fibonacci: "  # Define una cadena de texto para mostrar el resultado

.text
    main:
        # Solicita al usuario ingresar la cantidad de números
        li $v0, 4  # Carga el código de la llamada al sistema para imprimir una cadena de texto
        la $a0, num  # Carga la dirección de la cadena "Ingrese la cantidad de números en la serie de Fibonacci"
        syscall  # Realiza la llamada al sistema para imprimir la cadena

        li $v0, 5  # Carga el código de la llamada al sistema para leer un entero
        syscall  # Realiza la llamada al sistema para leer la cantidad ingresada por el usuario
        move $t0, $v0  # Almacena la cantidad ingresada en el registro $t0

        # Inicializa los primeros dos números de la serie
        li $t1, 0  # F(0)
        li $t2, 1  # F(1)

        # Imprime los primeros dos números
        li $v0, 4  # Carga el código de la llamada al sistema para imprimir una cadena de texto
        la $a0, fib  # Carga la dirección de la cadena "Serie de Fibonacci:"
        syscall  # Realiza la llamada al sistema para imprimir la cadena
        move $a0, $t1  # Carga el valor de F(0) en el registro $a0
        li $v0, 1  # Carga el código de la llamada al sistema para imprimir un entero
        syscall  # Realiza la llamada al sistema para imprimir F(0)
        move $a0, $t2  # Carga el valor de F(1) en el registro $a0
        syscall  # Realiza la llamada al sistema para imprimir F(1)

        # Genera el resto de la serie
        loop:
            add $t3, $t1, $t2  # Calcula F(n) = F(n-1) + F(n-2)
            move $t1, $t2  # Actualiza F(n-2) con el valor de F(n-1)
            move $t2, $t3  # Actualiza F(n-1) con el valor de F(n)

            # Imprime el siguiente número
            move $a0, $t3  # Carga el valor de F(n) en el registro $a0
            syscall  # Realiza la llamada al sistema para imprimir F(n)

            # Decrementa la cantidad restante
            subi $t0, $t0, 1  # Resta 1 a la cantidad restante
            bnez $t0, loop  # Si aún quedan números, vuelve al bucle

        # Termina el programa
        li $v0, 10  # Carga el código de la llamada al sistema para salir del programa
        syscall  # Realiza la llamada al sistema para finalizar el programa
