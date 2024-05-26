$fa = 1;
$fs = 0.4;

module robot_wheel(wheel_radius = 12, wheel_width = 4, tyre_diameter = 6, axle_diameter = 3)
{
    rotate([90, 0, 0]) {
        difference() {
            rotate_extrude(angle = 360) {
                difference() {
                    translate([0, -wheel_width / 2])
                        square([wheel_radius - tyre_diameter / 2, wheel_width]);
                    translate([wheel_radius - tyre_diameter / 2, 0])
                        circle(d = tyre_diameter);
                }
            }
            
            cylinder(h=wheel_width+1, r=axle_diameter/2, center=true);
        }
    }
}
robot_wheel(wheel_radius=20, wheel_width=6, tyre_diameter=4, axle_diameter=5);