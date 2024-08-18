$fa = 1;
$fs = 0.4;

module rounded_simple_wheel(wheel_radius = 12, wheel_width = 4, tire_diameter = 6)
{
    rotate([90, 0, 0]){
        rotate_extrude(angle = 360) {
            translate([wheel_radius - tire_diameter/2, 0])
                circle(d = tire_diameter);
        }

        cylinder(h=wheel_width, r=wheel_radius - tire_diameter / 2, center=true);
    }
}
rounded_simple_wheel();