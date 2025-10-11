# Sidewinder X2

Esta impresora la compré en 23/05/2023, habiendo ya desarmado, y vuelto a armar con éxito mi Hornet.

Con ella exploré [Octoprint](https://octoprint.org/) usando inicialmente una vieja laptop, con el cual cambié la interface de interacción con la impresora, de snicker-net con un pendrive a web.

Para instalarlo en mi laptop usé [octoprint_deploy](https://github.com/paukstelis/octoprint_deploy.git) que me evitó problemas en la instalación en la laptop. Habitualmente se instala usando octopi, que es una distro de Linux que viene para Raspberry PI y en ese momento no contaba con una.

Luego de esto, compré un single board computer (SBC) Raspberry PI B+ (14/04/2024), el que intenté usar con OctoPI, pero no tenia suficiente poder de cómputo, lo que producía que las impresiones se detuvieran por momentos, causando problemas en las mismas, lo que me forzó a volver a la laptop.

El uso de la laptop para otras tareas me obligaba a veces a reiniciarla, y como también estaba siendo servidor de Octoprint, me olvidaba de eso mientras estaba imprimiendo y me pasó que se me cortaban las impresiones por tales reinicios. No tenía plugins para reiniciar las impresiones, por lo que perdía tiempo, energía y plástico en esas ocasiones. Eso me reforzó la idea de tener un servidor dedicado como un Raspberry PI, por lo que compré un Raspberry Pi 4 en 16/07/2024, e instalé inicialmente OctoPI en él.

