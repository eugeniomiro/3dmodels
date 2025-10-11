include <BOSL2/std.scad>

// 📐 Parámetros configurables
rail_length      = 400;
rail_spacing     = 20;
nozzle_offset    = [0, 0, -2];
extruder_model   = "Dragonfly_BMO";
sensor_mount     = true;
duct_mount       = true;

// 🔩 Carro sobre MGN12
module rail_carriage() {
    attachable(anchor=CENTER) {
        cuboid([60, 40, 10], rounding=2, anchor=CENTER);

        union(){
            // Agujeros de montaje
            for (i = [0:rail_spacing:rail_length - rail_spacing])
                position(TOP + FRONT + LEFT)
                    up(5) right(i - rail_length/2)
                        cyl(d=4, l=10, anchor=CENTER);

            // Extrusor
            if (extruder_model == "Dragonfly_BMO")
                mount_dragonfly();

            // Sensor
            if (sensor_mount)
                mount_sensor();

            // Ducto Nevermore
            if (duct_mount)
                mount_duct();
        }
    }
}

// 🧵 Módulos auxiliares
module mount_dragonfly() {
    position(TOP + BACK + CENTER)
        up(nozzle_offset.z)
        cuboid([20, 20, 40], anchor=BOTTOM, rounding=1);
}

module mount_sensor() {
    position(RIGHT + BACK + TOP)
        up(5) right(5)
        cuboid([10, 10, 10], anchor=BOTTOM);
}

module mount_duct() {
    position(LEFT + FRONT + BOTTOM)
        down(15)
        cyl(d=14, l=30, anchor=TOP);
}

rail_carriage();