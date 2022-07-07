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

Así como también se diseña el estante con estructura matricial en donde se posicionaran las botellas.

<img src="https://i.postimg.cc/3w83DS4M/Estante.png" alt="drawing" width="400"/>

A partir de aquí se procede a diseñar las diferentes rutinas que conformarán el proceso de "pick and place" de las 3 botellas en 3 particiones diferentes del estante matricial. Para ello se plantea la siguiente estructura para las rutinas.

- **Rutinas "Pick"**:
Primero se plantean 3 rutinas en las que se toman las botellas, una botella por cada rutina, para luego llevarla a un punto específico por el que pasan todas botellas en su respectiva rutina, logrando así una transición más sencilla a las rutinas de posicionamiento. Es importante aclarar que en este caso se requieren de 3 rutinas, ya que las acciones de los smart objects usados son dependientes de un solo objeto al tiempo, por lo que se debe generar una acción de agarre por cada elemento, de la misma manera en que se hace cuando se va a liberar un cierto objeto del agarre inicial.

- **Rutinas de posicionamiento**:
En estas rutinas se continua con la manipulación de la botella que fue tomada en la parte anterior, para llevarla desde el punto en común que comparten las rutinas "Pick" para llevarlas hasta su destino en el estante matricial.

- **Rutinas "Place"**:
En estas últimas 3 rutinas se libera la botella que se ha venido manipulando en la ubicación de destino.


Una vez ya se han construido cada una de las rutinas, se procede a generar las señales que recibirán la información de los botones que permitirán elegir la clase de movimiento que se va a desarrollar. A continuación se muestran los botones generados.

<img src="https://i.postimg.cc/9XwHzRXY/Botones.jpg" alt="drawing" width="400"/>

En donde los botones obj1, obj2 y obj3 permiten elegir qué botella se va a tomar; mientras que los botones pos1, pos2, pos3, pos4, pos5 y pos6 permiten seleccionar el cajón en el que se depositará la respectiva botella. Finalmente se tiene el botón de start, que es el que da la señal de arranque para cuando ya se ha elegido la botella a manipular y su posición final.

Este procesamiento de señales fue hecho a partir de condicionales en RAPPID, en dónde la activación o desactivación de una señal implicaba la ejecución de una cierta rutina.



A continuación se muestra la simulación de este ejercicio.

[![Pick and Place](https://img.youtube.com/vi/CJVA7OCdlIg/0.jpg)](https://www.youtube.com/watch?v=CJVA7OCdlIg "Pick and Place")



