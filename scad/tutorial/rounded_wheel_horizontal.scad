$fa = 1;
$fs = 0.4;

wheel_radius = 12;
tire_diameter = 6;
wheel_width = 5;

rotate_extrude(angle = 360) {
    translate([wheel_radius - tire_diameter/2, 0])
        circle(d = tire_diameter);
}
cylinder(h=wheel_width, r=wheel_radius - tire_diameter / 2, center=true);
