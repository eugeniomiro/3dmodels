🧰 Checklist Maker: de la práctica a la producción
🔍 1. Soldadura y verificación con multímetro
- [ ] Practiqué soldaduras en plaquita perforada usando cables, headers o resistencias.
- [ ] Verifiqué continuidad entre pin y pista con el multímetro (modo pitido).
- [ ] Verifiqué que no haya cortocircuitos entre líneas vecinas (especialmente VCC y GND).
- [ ] Usé suficiente estaño para cubrir bien, sin formar “gotas”.
- [ ] Si pude, usé flux o una esponja húmeda para limpiar la punta del soldador.
💬 Tip: Una soldadura bien hecha es brillante, cóncava y firme.

🧪 2. Testeos de módulos en entorno de prueba (Raspberry Pi auxiliar)
- [ ] Conecté el sensor (como ADXL345) al Pi de pruebas con conexiones limpias y firmes.
- [ ] Verifiqué su presencia por I²C/SPI (i2cdetect o script de prueba en MicroPython).
- [ ] Leí registros clave como el Device ID (0x00) para confirmar que responde correctamente.
- [ ] Documenté el pinout usado y posibles particularidades del módulo.
🧠 Una lectura incorrecta del ID (como 0x00 o 0xFF) suele indicar un problema físico.

🔧 3. Compilación y despliegue desde entorno Ubuntu 24.04 (Raspberry Pi 3)
- [ ] Instalé dependencias necesarias (gcc-arm-none-eabi, make, python3...).
- [ ] Ejecuté make menuconfig para seleccionar el microcontrolador correcto.
- [ ] Compilé exitosamente klipper.bin o klipper.uf2.
- [ ] Transferí el binario al Pi de la impresora (por scp, red compartida o USB).
- [ ] Verifiqué versiones de firmware entre host y MCU con status en Mainsail.
💡 Bonus: Podés agregar un alias o script para automatizar esa transferencia y reinicio.

🔁 4. Despliegue final en Pi de producción
- [ ] Hice backup de la carpeta printer.cfg y cualquier configuración sensible.
- [ ] Subí el nuevo firmware y reinicié el firmware MCU desde Mainsail.
- [ ] Confirmé que no hay errores en la consola de Klipper.
- [ ] Probé sensores o funciones nuevas (como acelerómetro).
- [ ] Documenté el cambio en un README o changelog personal.

🗂️ 5. Documentación y comunidad
- [ ] Subí resultados, scripts o aprendizajes a mi repo de GitHub.
- [ ] Incluí notas sobre fallas, soluciones y mejoras posibles.
- [ ] Si se usaron remixes de la comunidad, se citó a los autores originales.
- [ ] Abrí la puerta a feedback para seguir mejorando el diseño.

6. Crimpeado de cables y conectores
- [ ] Usé cables adecuados para el conector (AWG correcto, generalmente 22–26 para electrónica en impresoras).
- [ ] Corté y pelé los cables sin dañar los hilos internos (uso de pelacables o técnica con cutter con mucho cuidado).
- [ ] Crimpié con una pinza adecuada para el conector (tipo JST-XH, Dupont, Molex, etc.).
- [ ] Verifiqué que el pin crimpado no se salga al tirar suavemente del cable.
- [ ] Inserté los pines en su carcasa verificando que trabe correctamente (clic audible o tope).
- [ ] Medí continuidad del cable ya crimpado de extremo a extremo.
- [ ] Verifiqué que no haya falsos contactos (moviendo el conector o flexionando levemente el cable).
- [ ] En lo posible, aseguré la conexión con termocontraíble o cinta kapton si está cerca de fuentes de calor o movimiento.
🎯 Bonus: Si usás conectores removibles, etiquetarlos o codificarlos por color ayuda un montón al mantenimiento.
