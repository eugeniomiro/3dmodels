$fa = 1;
$fs = 0.4;
wheel_radius = 10;
wheel_width = 4;
side_sphere_radius = 50;
difference() {
    sphere(r=wheel_radius);
    translate([0, -side_sphere_radius-wheel_width/2, 0])
        sphere(r=side_sphere_radius);
    translate([0, side_sphere_radius+wheel_width/2, 0])
        sphere(r=side_sphere_radius);
    translate([0, (wheel_width + 1)/2, wheel_radius/2])
        rotate([90,0,0])
        cylinder(h=wheel_width+1,r=2);
    translate([0, (wheel_width + 1)/2, -wheel_radius/2])
        rotate([90,0,0])
        cylinder(h=wheel_width+1,r=2);
    translate([wheel_radius/2, (wheel_width + 1)/2, 0])
        rotate([90,0,0])
        cylinder(h=wheel_width+1,r=2);
    translate([-wheel_radius/2, (wheel_width + 1)/2, 0])
        rotate([90,0,0])
        cylinder(h=wheel_width+1,r=2);
}