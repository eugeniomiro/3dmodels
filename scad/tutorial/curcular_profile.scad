$fa = 1;
$fs = 0.4;

wheel_radius = 12;
tire_diameter = 6;

translate([wheel_radius - tire_diameter/2, 0])
    circle(d = tire_diameter);