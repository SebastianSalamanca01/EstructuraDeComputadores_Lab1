.data
    num1: .asciiz "Ingrese el primer número: "  # Define una cadena de texto para solicitar el primer número al usuario
    num2: .asciiz "Ingrese el segundo número: "  # Define una cadena de texto para solicitar el segundo número al usuario
    num3: .asciiz "Ingrese el tercer número: "  # Define una cadena de texto para solicitar el tercer número al usuario
    mayor: .asciiz "El número mayor es: "  # Define una cadena de texto para mostrar el resultado

.text
    main:
        # Solicita al usuario ingresar tres números
        li $v0, 4  # Carga el código de la llamada al sistema para imprimir una cadena de texto
        la $a0, num1  # Carga la dirección de la cadena "Ingrese el primer número"
        syscall  # Realiza la llamada al sistema para imprimir la cadena

        li $v0, 5  # Carga el código de la llamada al sistema para leer un entero
        syscall  # Realiza la llamada al sistema para leer el primer número ingresado por el usuario
        move $t0, $v0  # Almacena el primer número en el registro $t0

        # Repite el proceso para los otros dos números
        li $v0, 4
        la $a0, num2
        syscall
        li $v0, 5
        syscall
        move $t1, $v0

        li $v0, 4
        la $a0, num3
        syscall
        li $v0, 5
        syscall
        move $t2, $v0

        # Compara los números para encontrar el mayor
        bgt $t0, $t1, check_t0_t2  # Compara $t0 con $t1; si $t0 > $t1, salta a la etiqueta check_t0_t2
        move $t1, $t2  # Si no, mueve el valor de $t2 a $t1

    check_t0_t2:
        bgt $t0, $t2, print_mayor  # Compara $t0 con $t2; si $t0 > $t2, salta a la etiqueta print_result
        move $t0, $t2  # Si no, actualiza $t0 con el valor de $t2

    print_mayor:
        li $v0, 4  # Carga el código de la llamada al sistema para imprimir una cadena de texto
        la $a0, mayor  # Carga la dirección de la cadena "El número mayor es:"
        syscall  # Realiza la llamada al sistema para imprimir la cadena

        move $a0, $t0  # Carga el valor del número mayor en el registro $a0
        li $v0, 1  # Carga el código de la llamada al sistema para imprimir un entero
        syscall  # Realiza la llamada al sistema para imprimir el número mayor

        # Termina el programa
        li $v0, 10  # Carga el código de la llamada al sistema para salir del programa
        syscall  # Realiza la llamada al sistema para finalizar el programa
