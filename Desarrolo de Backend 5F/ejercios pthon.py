''' # Ejercicios de Python
1- crear una funcion que reciva  2 numeros y defina el mayor de ellos
2- suma de tres nuemros defina una funcion que devuelva suma de 3 numeros
3- escriba una funcion que muestre un mensaje aleatorio ""
4- crea una funcion que devuelva true si el numero es par y false si es impar
5- escribir una funcion  que determine si una palabra es palindroma o sea si se lee igual de izquierda a derecha y de derecha a izquierda debe validar que no haya espacios en blanco y no distinga entre mayusculas y minusculas
'''
import random
def mayor_de_dos(num1, num2):
    if num1 > num2:
        return num1
    else:
        return num2
def suma_de_tres(num1, num2, num3):
    return num1 + num2 + num3
def mensaje_aleatorio():
    mensajes = ["Hola", "Bienvenido", "Adiós", "Gracias"]
    return random.choice(mensajes)
def es_par(num):
    return num % 2 == 0
def es_palindromo(palabra):
    palabra = palabra.replace(" ", "").lower()
    return palabra == palabra[::-1]