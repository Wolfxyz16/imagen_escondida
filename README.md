# Trabajo final: Imagen escondida

Se trata de un pasatiempo de lógica que forma una figura pixelada cuando se termina. El juego es similar al buscaminas, ya que se basa en una cuadrícula que esconde la imagen. El jugador de este solitario debe decidir qué cuadros se tienen que pintar de negro y cuáles no hasta que se tenga una visión completa de la figura.

Estos pasatiempos tienen un nivel avanzado en el que se tienen en cuenta la situación de varias pistas para decidir el color de una casilla, pero nosotros nos vamos a quedar con el nivel básico, en el que el pasatiempo se puede resolver mirando siempre los valores de una de las casillas. Se puede considerar una extensión de la práctica estos pasatiempos más complicados.

La figura anterior muestra el pasatiempo al
comienzo, cuando aún no se ha decidido el
color de ninguna casilla. Las dos siguientes
muestran el puzzle en un estado intermedio
durante el desarrollo, en el que ya se han
decidido algunas casillas que permanecen
desocupadas (marcadas con una X), y cuales
pintadas de negro.
Finalmente, la figura siguiente muestra la
figura final (¿un camión y un sol?) porque
ya se ha decidido sobre si deben
permanecer en blanco o negro todas las
piezas.

El método de resolución se puede describir
con un pasatiempo más pequeño.
Supongamos que partimos del pasatiempo
de la figura 1. Las pistas nos indican
cuantas casillas se deben colorear en un
recuadro formado por 9 cuadritos: las
casillas que rodean a una dada junto con
dicha casilla. En el caso de los laterales, el
número de casillas disminuye y en las
esquinas aún más.

La práctica consiste en implementar varios
subprogramas que se pueden utilizar en el
desarrollo del juego. En el desarrollo utilizarán la mayoría de los conceptos que
se han visto en clase: Entrada/salida de
datos. Se proporciona un tipo de datos para
la implementación de los distintos
subprogramas y se pide la realización de un
programa que permita funcionar en dos
modos: el modo automático que permite
que sea el propio sistema descubra cuál es
la solución del puzle y el modo interactivo
que permite al usuario indicar una
coordenada y decidir si es correcta o no. Así
mismo, tiene que dar la posibilidad de
guardar el estado actual de la partida para
poder retomarlo en un momento 
