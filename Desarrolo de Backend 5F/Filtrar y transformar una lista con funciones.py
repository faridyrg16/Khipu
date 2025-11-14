# -*- coding: utf-8 -*-

def es_par(numero):
  """
  Devuelve True si un número es par, False en caso contrario.
  """
  return numero % 2 == 0

def cuadrado(numero):
  """
  Devuelve el cuadrado de un número.
  """
  return numero ** 2

def procesar_lista(lista_numeros, filtro, transformacion):
  """
  Filtra una lista usando una función 'filtro' y luego aplica
  una función 'transformacion' a los elementos filtrados.
  """
  lista_filtrada = []
  for numero in lista_numeros:
    if filtro(numero):
      lista_filtrada.append(numero)
  
  lista_transformada = []
  for numero in lista_filtrada:
    lista_transformada.append(transformacion(numero))
    
  return lista_transformada

# --- Función principal del programa ---
def main():
  """
  Función principal que pide datos y muestra los resultados.
  """
  # 1. Pedir la lista de números al usuario
  entrada_usuario = input("Introduce una lista de números (separados por comas): ")
  
  lista_numeros = []
  try:
    # Convertimos la entrada en una lista de strings
    numeros_str = entrada_usuario.split(',')
    # Convertimos cada string en un número entero
    for num_str in numeros_str:
      lista_numeros.append(int(num_str.strip()))
  except ValueError:
    print("Error: Asegúrate de introducir solo números separados por comas.")
    return

  print(f"\nLista original: {lista_numeros}")

  # 2. Procesamiento 1: Números pares elevados al cuadrado
  # Usamos las funciones que definimos
  pares_al_cuadrado = procesar_lista(lista_numeros, es_par, cuadrado)
  print(f"Pares al cuadrado: {pares_al_cuadrado}")

  # 3. Procesamiento 2: Números impares multiplicados por 3
  # Podemos definir funciones "al vuelo" usando lambda
  
  # Definimos la lógica del filtro (impar)
  es_impar = lambda n: not es_par(n)
  
  # Definimos la lógica de la transformación (multiplicar por 3)
  multiplicar_por_3 = lambda n: n * 3
  
  impares_por_3 = procesar_lista(lista_numeros, es_impar, multiplicar_por_3)
  print(f"Impares por 3: {impares_por_3}")

if __name__ == "__main__":
  main()
