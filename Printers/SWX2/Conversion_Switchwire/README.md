# Proyecto: Conversión Sidewinder X2 → Voron Switchwire

Este repositorio documenta la transición de una **Artillery Sidewinder X2** hacia una plataforma inspirada en el **Voron Switchwire**, utilizando electrónica avanzada, mejoras mecánicas y un enfoque modular.

---

## 🔧 Hardware disponible

- **Raspberry Pi 4** (host con Klipper + Mainsail/Fluidd)
- **BigTreeTech Octopus Pro 1.1 (H723)**
- **BigTreeTech EBB36 v1.2** con **ADXL345 integrado**
- **Drivers TMC2209** (8 unidades, se usarán 3–4)
- **Motores NEMA17 17HS4401S** (varios repuestos)
- **Motor NEMA14** para Stealthburner
- **Extrusión de aluminio 2020** (1 m, se requerirá más)
- **Linear rails HIWIN** (MGN12H)
- **Hotend E3D Revo V6** con **termistor 104NT**

---

## 🛠️ Diagnóstico inicial

- **Motor X no respondía**  
  - Drivers y motor descartados.  
  - Problema localizado en **cable mal conectado**.  
  - Solución: reconexión correcta → sistema funcionando.

---

## 📐 Estrategia de integración

1. **Transición electrónica**  
   - Migrar a Octopus Pro + Raspberry Pi 4 con Klipper.  
   - Instalar **Katapult** en Octopus para evitar DFU manual.  
   - Configurar drivers TMC2209.

2. **Cabezal y extrusión**  
   - Integrar EBB36 v1.2 vía **CANbus**.  
   - Conectar NEMA14 y Revo V6.  
   - Configurar termistor 104NT en Klipper.

3. **Mecánica**  
   - Instalar linear rails HIWIN en X/Y.  
   - Usar extrusión 2020 para refuerzos iniciales.  
   - Planificar chasis CoreXZ completo.

4. **Optimización**  
   - Calibrar PID del hotend y cama.  
   - Usar ADXL345 para Input Shaper.  
   - Ajustar perfiles de impresión en OrcaSlicer.

5. **Conversión gradual a Switchwire**  
   - Migrar a cinemática CoreXZ.  
   - Documentar cada paso en el repositorio.  
   - Construir enclosure modular.

---

## 📦 Bill of Materials (BOM)

### Electrónica
- Octopus Pro H723 (ya disponible)
- Raspberry Pi 4 (ya disponible)
- EBB36 v1.2 con ADXL345 (ya disponible)
- Drivers TMC2209 (usar 3–4)
- PSU 24 V, 350–400 W
- Conectores JST-XH, MicroFit/MiniFit
- Cable AWG18–26, malla trenzada, termorretráctil

### Motores y transmisión
- NEMA17 (X/Y/Z)
- NEMA14 (extrusor Stealthburner)
- Correas GT2 6 mm (~10–12 m)
- Poleas GT2 20T (6–8 unidades)
- Idlers GT2 20T con rodamientos (6–8 unidades)

### Mecánica
- Extrusión 2020 (~6–7 m total para chasis completo)
- Linear rails HIWIN MGN12H (X/Y)
- Tornillería M3/M4/M5 variada
- Tuercas T-slot M5 (50–80 unidades)
- Insertos roscados M3
- Escuadras internas/externas para 2020
- Paneles acrílico/PC para enclosure (opcional)

### Hotend y extrusión
- E3D Revo V6 con termistor 104NT
- Boquillas Revo (0.4 / 0.6 mm)
- Cartucho calefactor 24 V, 40 W
- Ventiladores 5015 (part cooling) y 4010 (hotend)


---

## 🔌 Wiring con CANbus

### Raspberry Pi 4
- Conexión principal: Ethernet/WiFi para control remoto.  
- USB solo para Octopus (si se mantiene).  

### Octopus Pro H723
- **CANbus out**: conector JST de 4 pines.  
  - **CAN_H / CAN_L** → par trenzado AWG24–26.  
  - **24 V / GND** → alimentación al EBB36.  
- **Motores X/Y/Z** → sockets TMC2209.  
- **Bed heater + termistor** → salidas dedicadas.  
- **Endstops** → pines X/Y/Z.

### EBB36 v1.2 (cabezal)
- Conexión CANbus desde Octopus (datos + 24 V).  
- Motor extrusor NEMA14 → driver integrado.  
- Hotend Revo V6 → heater `PA0`, termistor `PA1`.  
- Ventiladores → `PA2` (part cooling), `PA3` (hotend fan).  
- ADXL345 integrado → SPI interno.

---

## 🖥️ Configuración Klipper con CANbus + Katapult

### MCU principal (Octopus Pro con Katapult)
```ini
[mcu octopus]
canbus_uuid: 1234567890abcdef
restart_method: command
```

### MCU secundario (EBB36 v1.2)
```ini
[mcu ebb36]
canbus_uuid: abcdef1234567890
restart_method: command
```

*(El `canbus_uuid` se obtiene con canbus_query.py en la Pi.)*

### Extrusor (Stealthburner + Revo V6)
```ini
[extruder]
step_pin: ebb36:PB4
dir_pin: ebb36:PB3
enable_pin: !ebb36:PB5
microsteps: 16
rotation_distance: 22.678
heater_pin: ebb36:PA0
sensor_type: EPCOS 100K B57560G104F
sensor_pin: ebb36:PA1
min_temp: 0
max_temp: 300
```

### Input Shaper
```ini
[adxl345]
cs_pin: ebb36:PB12
spi_bus: spi1
axes: x,y,z
[resonance_tester]
accel_chip: adxl345
probe_points:
    100,100,20
```

### 📂 Organización de archivos .cfg
- printer.cfg → archivo principal con includes
- motors.cfg → define X, Y, Z en Octopus
- EBB.cfg → extrusor, hotend, fans, ADXL345
- bed.cfg → heater bed + sensor
- fans.cfg → ventiladores adicionales
- macros.cfg → macros de homing y utilitarios

Ejemplo:
```ini
[include motors.cfg]
[include EBB.cfg]
[include bed.cfg]
[include fans.cfg]
[include macros.cfg]
```

### 📚 Notas finales
- El Revo V6 con termistor 104NT se configura como EPCOS 100K B57560G104F.
- El ADXL345 del EBB36 v1.2 simplifica la calibración de vibraciones.
- Katapult permite actualizar Klipper en la Octopus sin DFU manual.
- CANbus reduce cableado y mejora robustez frente a interferencias.
- Documentar cada paso en este repositorio permitirá replicar y compartir el proceso con la comunidad maker.
