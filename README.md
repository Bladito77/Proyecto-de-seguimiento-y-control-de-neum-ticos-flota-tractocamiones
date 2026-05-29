##Sistema Inteligente de Gestión de Llantas
Descripción

"Soy ingeniero mecánico y he trabajado con operaciones industriales y de transporte. Identifiqué que el control de llantas es uno de los mayores costos operacionales de una flota, por lo que decidí aplicar analítica de datos para transformar información dispersa en indicadores de mantenimiento, trazabilidad y toma de decisiones."


Proyecto de Business Intelligence desarrollado para la gestión y trazabilidad de llantas en flotas de transporte pesado.

La solución integra una base de datos MySQL y un dashboard interactivo desarrollado en Power BI para analizar desgaste, mantenimiento, movimientos operacionales, vida útil y costos asociados a las llantas.

Objetivo

Transformar datos operacionales en información estratégica que facilite:

Control de desgaste.
Gestión de mantenimiento.
Seguimiento de vida útil.
Evaluación de marcas.
Optimización de costos.
Toma de decisiones basada en datos.
Tecnologías utilizadas
MySQL
SQL
Power BI
DAX
Power Query
Arquitectura General
MySQL
   ↓
Power Query
   ↓
Modelo Estrella
   ↓
Power BI
   ↓
Dashboard Ejecutivo
Descripción del Modelo Relacional

Diagrama que Relacional.

"El modelo fue diseñado para representar el ciclo de vida completo de una llanta dentro de una flota de transporte pesado. Partimos de entidades maestras como vehículos, rutas, posiciones y referencias de llanta. A partir de ellas se registran viajes, montajes, inspecciones, movimientos y eventos mecánicos, permitiendo realizar trazabilidad completa desde la instalación hasta el final de la vida útil. Este modelo soporta tanto el análisis operativo como el análisis financiero mediante indicadores de desgaste, costo por kilómetro y rendimiento por marca."

<img width="1085" height="873" alt="image" src="https://github.com/user-attachments/assets/7bc42d96-c5ee-4ffb-8331-730ba94ebd14" />


Tabla rutas

Almacena la información geográfica y operacional de las rutas utilizadas por la flota.

Campos principales:

id_ruta
región
origen
destino
kilómetros
Tabla vehículos

Contiene la información básica de cada tractocamión.

Campos principales:

placa
tipo
Tabla llantas

Representa el inventario de llantas de la operación.

Campos principales:

id_llanta
referencia
estado
vida útil
Tabla referencias_llanta

Contiene las características técnicas de cada referencia comercial.

Campos principales:

marca
ancho
perfil
rin
profundidad nueva
valor comercial

Esta tabla es fundamental para calcular:

costo por milímetro
costo por kilómetro
rendimiento por marca
Tabla posiciones

Define la ubicación física de cada llanta dentro del vehículo.

Ejemplos:

Dirección
Tracción
Trailer

Permite analizar diferencias de desgaste según la posición.

Tabla montajes

Relaciona las llantas con los vehículos y las posiciones donde fueron instaladas.

Permite conocer:

dónde estuvo instalada una llanta
cuándo fue montada
kilómetros iniciales
Tabla viajes

Registra la operación diaria de transporte.

Campos:

vehículo
ruta
kilómetros recorridos
fecha

Es una de las principales tablas de hechos.

Tabla detalle_viaje_llanta

Registra el consumo operativo de cada llanta durante los viajes.

Permite medir:

desgaste acumulado
kilometraje por llanta
rendimiento operativo
Tabla inspecciones

Almacena las mediciones periódicas de profundidad de labrado.

Campos:

mm_actual
km_acumulado
fecha

Es la principal fuente para análisis de desgaste.

Tabla movimientos_llanta

Registra los eventos operacionales asociados a las llantas.

Ejemplos:

Montaje
Rotación
Reencauche
Desmontaje

Permite construir la trazabilidad completa.

Tabla eventos_mecanicos

Almacena eventos relacionados con mantenimiento del vehículo.

Ejemplos:

Falla de frenos
Suspensión
Mantenimiento preventivo
Relación General del Modelo

El modelo fue construido bajo una estructura orientada a análisis dimensional.

Dimensiones
Vehículos
Rutas
Posiciones
Referencias de llantas
Hechos
Viajes
Detalle viaje llanta
Inspecciones
Movimientos
Eventos mecánicos

Esta estructura permite analizar la información desde múltiples perspectivas:

Por vehículo
Por región
Por marca
Por posición
Por fecha
Por estado de la llanta
Dashboard Desarrollado
1. Visión Ejecutiva

Indicadores generales de operación.

KPIs:

Total vehículos
Total llantas
Total viajes
Kilómetros recorridos
Eventos mecánicos
Desgaste promedio
2. Análisis Operativo

Permite identificar:

Regiones de mayor desgaste
Movimientos operacionales
Tendencias de mantenimiento
3. Trazabilidad y Mantenimiento

Seguimiento histórico de cada llanta.

Incluye:

inspecciones
reencauches
desmontajes
vida útil
4. Rendimiento de Llantas

Comparación entre marcas y tipos de servicio.

Permite evaluar:

rendimiento
desgaste
costo por milímetro
desempeño operacional
Resultados

Durante la simulación se generaron aproximadamente:

3.656 viajes
47.422 registros operacionales
8.276 inspecciones
21.930 movimientos de llantas
882 eventos mecánicos

Lo anterior permitió construir escenarios realistas de análisis para una flota de transporte pesado.

## Resultados de la simulación

- 3.656 viajes simulados
- 47.422 registros operacionales
- 21.930 movimientos de llantas
- 8.276 inspecciones
- 882 eventos mecánicos
- Proyección operacional de 3 años



Edwin Bladimir Torres Corredor
Ing Mecánico
Optimus Systems Ingeniería SAS
www.optimussystem.com
Dirección: Calle 79 No. 61 - 25 Int 202
Tel: (1) 301 87 33 
Móvil: 300-569 42 01  316- 566 25 38
Bogotá D.C.
 Evita imprimir este mensaje si no es estrictamente necesario. De esta manera ahorras agua, energía y recursos forestales. Proteger el medio ambiente está en sus manos.

