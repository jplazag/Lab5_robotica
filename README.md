# Lab5_robotica

## Descripción del ejercicio

Para esta práctica se plantean dos actividades a desarrollar, ambas orientadas al uso de entradas y salidas digitales para controlar que rutina es ejecutada en qué momento.

### Tarea 1
La primera actividad se centra en combinar las rutinas creadas para la práctica anterior por medio de un control por 2 botones, en donde cada botón representa la activación de una de las dos rutinas.

Para esto se hace uso del sistema de creación de señales que provee Robot Studio, creando 2 señales que recibiran las entradas digitales de los dos botones antes mencionados. Una vez se ha generado esta interfaz entre el mundo físico y virtual, se procede a procesar estas señales digitales a través del uso de condicionales en RAPPID, permitiendo así que un clasificador defina qué rutina se activa dependiendo de la señal que tiene un valor igual a 1.


A continuación se presenta un video de la ejecución de las rutinas en el laboratorio.
[![Práctica en el laboratorio](https://img.youtube.com/vi/H6_FSDALVg4/0.jpg)](https://www.youtube.com/watch?v=H6_FSDALVg4 "Práctica en el laboratorio")


### Tarea 2
Para la segunda actividad se propone un ejercicio de Pick and Place, en el que se deben mover 3 elementos a un estante con forma matricial de 3 filas por 2 columnas.

Para este planteamiento se diseña un gripper con ventosa como se muestra a continuación.

<img src="https://i.postimg.cc/3NCLpB06/Ventosa.png" alt="drawing" width="200"/>

De la misma manera se diseña el modelo de una botella, que hará las veces del elemento a mover y posicionar en el estante.

<img src="https://i.postimg.cc/D0Kj8D0L/Botella.png" alt="drawing" width="200"/>

Así como también se diseña el estante con estructura matricial en donde se posicionaran las botellas
