use <enclosure_lib.scad>

$fn=50;
difference() {
    linear_extrude(200) 
        top_profile(3);
    translate([15,10,50])
        rotate([90,0,0])
            cylinder(15, 1.5, 1.5);
    translate([15,10,150])
        rotate([90,0,0])
            cylinder(15, 1.5, 1.5);
}