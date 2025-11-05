def leer_numero(prompt):
    while True:
        s = input(prompt).strip().replace(',', '.')
        try:
            return float(s)
        except ValueError:
            print("Entrada inválida. Por favor, ingresa solo números.")
nota1 = leer_numero("Ingresa la primera nota: ")
nota2 = leer_numero("Ingresa la segunda nota: ")
nota3 = leer_numero("Ingresa la tercera nota: ")

promedio = (nota1 + nota2 + nota3) / 3

if promedio >= 7:
    print(f"Tu promedio es {promedio:.2f}. ¡Aprobaste!")
elif promedio >= 5 and promedio <= 6.9:
    print(f"Tu promedio es {promedio:.2f}. Necesitas recuperación.")
else: 
    print(f"Tu promedio es {promedio:.2f}. Reprobaste.")