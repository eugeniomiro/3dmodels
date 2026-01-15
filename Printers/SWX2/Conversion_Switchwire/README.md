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

*(igual que la versión anterior, ver sección BOM completa)*

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