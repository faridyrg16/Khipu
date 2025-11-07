def sumar (a, b):
    resultado = a + b
    return resultado
def restar (a, b):
    resultado = a - b
    return resultado
def multiplicar (a, b):
    resultado = a * b
    return resultado
def dividir (a, b):
    if b == 0:
        return "Error: División por cero"
    resultado = a / b
    return resultado
def calcular_promedio(notas):
    if len(notas) == 0:
        return 0
    suma = sum(notas)
    promedio = suma / len(notas)
    return promedio