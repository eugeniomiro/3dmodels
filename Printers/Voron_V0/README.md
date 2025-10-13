# Siboor Voron V0.2 R2

Cuando compré esta impresora, en Mayo de 2025, [Siboor](https://www.siboor.com/), el proveedor, antes de que la impresora me llegara, ya me había mandado información de la documentación y del Discord server de Siboor, adonde podía informarme y preguntar lo que necesitara.

Luego de tres semanas de espera (la verdad que bastante poco comparado con otras compras que hice en AliExpress) llegó la impresora, en una cajita con mi nombre escrito a mano y algunas letras chinas.

Tardé algo menos de dos semanas en armarla, trabajo de por medio, pero no anduvo de entrada. Algunos contratiempos con el armado... ejem... hicieron que recién en Octubre pudiera comenzar a usarla con confianza.

Las primeras impresiones fueron en Junio, pero por un motivo o por otro todo se fue retrasando.

Primero algunos problemas con los Drivers TMC 2205, los que me fueron enviados como repuesto poco tiempo después de la compra pero tardaron infinito en llegar (2 meses y medio), y los tuve que ir a buscar personalmente porque no podían creer que me hayan cobrado $1 por ellos, gracias Aduana Argentina.

Luego, el cable del Umbilical no conectaba bien, y el extrusor dejaba de extruir. Mi falta de experiencia hizo que comenzara a intercambiar motores, siempre llegando al mismo punto. El extrusor dejaba de extruir. El tema era el cable que con las vibraciones dejaba de hacer contacto.

Con tantas idas y vueltas en varias oportunidades se me llenó unas de las particiones /var/log, no permitiéndome instalar nuevo software, la última vez fue ayer (hoy es 12/10/2025), cuando quise instalar **gh** para subir el repo de configuración de la impresora a GitHub.

Para subsanar ese problema usé el comando:
```
sudo journalctl --vacuum-time=10d
```
el que elimina el log más antiguo que 10 días para liberar espacio en la partición

El día de hoy además envié el [Serial Request en r/voroncorexy](https://www.reddit.com/r/voroncorexy/comments/1o4vxhn/serial_request_voron_02_r2_siboor_kit_discord/)