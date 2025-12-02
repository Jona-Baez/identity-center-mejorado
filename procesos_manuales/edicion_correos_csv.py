import csv

# Archivo de entrada y salida
archivo_entrada = 'correos.csv'
archivo_salida = 'correos_formateados.csv'

# Nombre de la columna de correos
nombre_columna = 'email'

# Leer el archivo CSV
with open(archivo_entrada, newline='', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile)
    correos_formateados = [f'"{row[nombre_columna]}",' for row in reader]

# Guardar en archivo plano sin csv.writer
with open(archivo_salida, 'w', encoding='utf-8') as salida:
    for correo in correos_formateados:
        salida.write(correo + '\n')

print("✅ Correos guardados correctamente.")