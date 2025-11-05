nota1 = float(input("Ingresa la primera nota: "))
nota2 = float(input("Ingresa la segunda nota: "))
nota3 = float(input("Ingresa la tercera nota: "))

promedio = (nota1 + nota2 + nota3) / 3

if promedio >= 7:
    print(f"Tu promedio es {promedio:.2f}. ¡Aprobaste!")
elif promedio >= 5 and promedio <= 6.9:
    print(f"Tu promedio es {promedio:.2f}. Necesitas recuperación.")
else: 
    print(f"Tu promedio es {promedio:.2f}. Reprobaste.")