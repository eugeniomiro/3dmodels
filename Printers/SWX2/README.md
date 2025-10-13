# Sidewinder X2

Esta impresora la compré en 23/05/2023, habiendo ya desarmado, y vuelto a armar con éxito mi Hornet.

Con ella exploré [Octoprint](https://octoprint.org/) usando inicialmente una vieja laptop, con el cual cambié la interface de interacción con la impresora, de snicker-net con un pendrive a web.

Para instalarlo en mi laptop usé [octoprint_deploy](https://github.com/paukstelis/octoprint_deploy.git) que me evitó problemas en la instalación en la laptop. Habitualmente se instala usando octopi, que es una distro de Linux que viene para Raspberry PI y en ese momento no contaba con una.

Luego de esto, compré un single board computer (SBC) Raspberry PI B+ (14/04/2024), el que intenté usar con OctoPI, pero no tenia suficiente poder de cómputo, lo que producía que las impresiones se detuvieran por momentos, causando problemas en las mismas, lo que me forzó a volver a la laptop.

El uso de la laptop para otras tareas me obligaba a veces a reiniciarla, y como también estaba siendo servidor de Octoprint, me olvidaba de eso mientras estaba imprimiendo y me pasó que se me cortaban las impresiones por tales reinicios. No tenía plugins para reiniciar las impresiones, por lo que perdía tiempo, energía y plástico en esas ocasiones. Eso me reforzó la idea de tener un servidor dedicado como un Raspberry PI, por lo que compré un Raspberry Pi 4 en 16/07/2024, e instalé inicialmente OctoPI en él.

Luego conocí Klipper, el que mejora el desempeño de la impresora, delegando la decodificación de los GCODEs a una computadora de alto nivel, dejando solo el control del hardware en los microcontroladores. Además permite el uso de múltiples microcontroladores con una sola computadora, siendo la misma un Single Board Computer o una computadora regular. 

Para instalar Klipper en el PI utilicé MainsailOS y [este video de Ethereal Project 3d](https://www.youtube.com/watch?v=7iQK6uSapJ0). Una diferencia, no usé Putty, usé el ssh de Windows 11, que me permite lo mismo que Putty.

Luego de mi inicio con este método volví a instalar pero esta vez usando MainsailOS, el que viene ya instalado con todo lo que Kiauh instala, lo que necesitamos solamente es instalar print.cfg y los archivos incluidos.

El 14 de Agosto de 2023 compré una plancha de acrílico transparente para comenzar el enclosure que me permitiría imprimir con ABS. El folder [enclosure](enclosure/) dentro de este folder contiene los stl que fui diseñando para el modelo original. Luego lo cambié por [este](https://www.printables.com/model/1052036-printed-enclosure-project-step-file), con algunas modificaciones por la dimensión, pero no completé todas las piezas aún, dado que le hice algunos cambios, pero no me puse a terminarlo, cosa que me debo todavía.
