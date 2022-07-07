# Lab5_robotica

## Descripción del ejercicio

Para esta práctica se plantean dos actividades a desarrollar, ambas orientadas al uso de entradas y salidas digitales para controlar que rutina es ejecutada en qué momento.

### Tarea 1
La primera actividad se centra en combinar las rutinas creadas para la práctica anterior por medio de un control por 2 botones, en donde cada botón representa la activación de una de las dos rutinas.

Para esto se hace uso del sistema de creación de señales que provee Robot Studio, creando 2 señales que recibiran las entradas digitales de los dos botones antes mencionados. Una vez se ha generado esta interfaz entre el mundo físico y virtual, se procede a procesar estas señales digitales a través del uso de condicionales en RAPPID, permitiendo así que un clasificador defina qué rutina se activa dependiendo de la señal que tiene un valor igual a 1.

En este primer ejercicio se usaron las rutinas que pudimos encontrar en el cuarto laboratorio que podemos encontrar en el siguiente repositorio (https://github.com/amedinae/robotics_lab_4) , con el objetivo de aliviar los errores encontrados en el cuarto laboratorio se hicieron varios cambios, para recordar, estos retos y sus soluciones fueron:

- El plano inclinado contaba con un angulo de rotación en el eje z del world El cual en el momento de hacer el montaje fisico era dificil de identificar, por lo que se llevo acabo todo un proceso de prueba y error alrededor de estos. Este angulo de rotación se definio como 30 grados, de esta manera era posible medirlo con una escuadra.

- Las letras estaban muy cerca a la medida maxima del tablero, lo que teniendo en cuenta que cuenta con una estructura pegada hizo problematico cuadrar el tablero. Se hizo el espaciado entre las letras 4cm más pequeño.

- El eje x del workobject inclinado estaba mas lejos de lo que teniamos como base en el laboratorio, lo que causo que tuvieramos que extender la base con utensilios escolares como cuadernos y carpetas. Para esto la solución era acercarlo en este eje, aunque suene simple debido a las configuraciones esto consideraba un reto ya que a medida que se acercaba al robot menos configuraciones eran posibles. Para solucionar esto fue necesario cambiar un  path del espacio cartesiano al espacio de las juntas con el objetivo de que se cambiara la configuración entre palabras y asi se pudiera llegar a distintas zonas en distintas configuraciones.

Una vez se solucionaron estos problemas se procedio a posicionar en un solo programa, los dos path como procedimientos fuera del main routine. A estos se les llamo path_inclinado y path_plano. Posterior a esto es necesario realizar la rutina main que se encargara de manejar el uso de estos paths.Para ello, se realizo la creación de dos entradas digitales (posteriormente ya creadas en el controlador fisico) en Robot Studio, bajo la pestaña de Controlador-Configuration-I/O Systems y la creación de una nueva señal accesible.

El main routine consta del uso de estas dos señales de entrada digital para la elección de una de las dos rutinas, esto se puede realizar gracias a un if que como argumento tiene eventos mutualmente excluyentes en los que la activación de uno de los dos botones realiza la elección de los path. Otro dato importante a mencionar es que el main solo realiza la validación de if una vez. Esto debido a que este codigo se puede activar ciclicamente en el controlador fisico IRC5 y de esta manera puede correr el main de manera recurrente, evaluando asi los botones cada vez que se termine un path, y este a la espera de un nuevo comando.

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

Aca se muestra el arreglo de condicionales para la selección de la botella.

<img src="https://i.postimg.cc/MGBrqRmn/If1.png" alt="drawing" width="700"/>

Y acá se muestra el arreglo de condicionales para la selección de rutas para depositar la respectiva botella en cada uno de los cajones del estante.

<img src="https://i.postimg.cc/vBd2BB03/if2.png" alt="drawing" width="700"/>



A continuación se muestra la simulación de este ejercicio.

[![Pick and Place](https://img.youtube.com/vi/CJVA7OCdlIg/0.jpg)](https://www.youtube.com/watch?v=CJVA7OCdlIg "Pick and Place")


## Análisis

### Analisis del primer punto: 

- La validación fisica del espacio y las herramientas a disposicion hizo de esta practica algo mucho más facil de montar. Lo cual ahorro mucho tiempo, de esto podemos hacer el analisis de la necesidad de conocer, controlar y supervisar el ambiente bajo el cual va a trabajar el robot, sobretodo en aplicaciones donde el mismo no tiene la sensorica para detetar su ambiente, sino asi como en esta practica sigue una rutina de posición a seguir sin importar sus alrededores.
- El uso de varias configuraciones dentro de una rutina puede contribuir a nuevos path posibles, dentro de los que el robot puede manejar diferentes poses con el objetivo de llevar acabo la mejor segun la necesidad, el objetivo, el ambiente y los futuros path a llevar acabo. 
- La entradas digitales desde una aplicación basica como esta nos permiten el control de distintas rutinas con caracteres diferentes, esto puede extenderse a distintas aplicaciones donde se puede llevar acabo una decisión dependiendo de las necesidad de automatización.

### Analisis del segundo punto: 

- Con cada práctica que vamos desarrollando vamos conociendo más de todas las utilidades que representan los robots a la hora de solucionar problemas, como hoy lo pudimos aprender a la hora de hacer una aproximación a una actividad de pick and place industrial.

- Dividir los movimientos del robot en 3 tipos de rutinas diferentes fue de gran utilidad, ya que de otra manera hubiera sido necesario hacer 6 rutas para cada botella, llevando a 18 rutinas para las 3 botellas, a diferencia de las 12 que se plantearon para resolver el problema. Esto puede parecer una diferencia bastante pequeña, pero también se debe considerar que si el número de botellas aumenta, esta diferencia también lo hará y por ende la primera aproximación de hacer 6 rutinas por botellaa demandaría más recursos a la hora de diseñar e implementar la solución.

## Conclusiones

- Aún nos falta mucho camino por recorrer a la hora de hablar de softares como Robot Studio, ya que a la hora de desarrollar la tarea 2 de Pick and Place, nos encontramos con un problema al querer mover piezas con diferentes formas, debido a que no hallamos una forma de hacer que el manipulador modifique sus movimientos en aras de adaptarce a geometrías variadas. 

- 
