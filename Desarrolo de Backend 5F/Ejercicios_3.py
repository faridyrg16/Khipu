def leer_numero(mensaje):
    while True:
        entrada = input(mensaje).strip().replace(',', '.')
        try:
            numero = float(entrada)
            return numero
        except ValueError:
            print("Entrada inválida. Por favor, ingresa solo números.")
nota1 = leer_numero("Ingresa el primer numero: ")
nota2 = leer_numero("Ingresa el segundo numero: ")
def sumar (a, b):
    resultado = a + b
    return resultado
resultadototal = sumar(nota1,nota2)
print(resultadototal)
def restar (a, b):
    resultado = a - b
    return resultado
resultadototal = restar(nota1,nota2)
print(resultadototal)
def multiplicar (a, b):
    resultado = a * b
    return resultado
resultadototal = multiplicar(nota1,nota2)
print(resultadototal)
def dividir (a, b):
    if b == 0:
        return "Error: División por cero"
    resultado = a / b
    return resultado
resultadototal = dividir(nota1,nota2)
print(resultadototal)
def calcular_promedio(notas):
    if len(notas) == 0:
        return 0
    suma = sum(notas)
    promedio = suma / len(notas)
    return promedio
notas = [nota1, nota2]
promedio = calcular_promedio(notas)