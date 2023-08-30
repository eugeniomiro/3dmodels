use <enclosure_lib.scad>

$fn=50;
wall_h = 3;
h=50;
d=50;
w=50;
gutter_width=3;
difference() {
    union() 
    {
        translate([0, 0, wall_h])
            SimpleCorner(wall_h, w, h, d, gutter_width);
        translate([0, 0, 0])
            cube([w, wall_h * 2, wall_h]);
        translate([w - wall_h, 0, 0])
            cube([wall_h, w, wall_h]);
    }
    // back hole
    translate([
        w / 2 ,
        wall_h+1,
        h / 2
    ])
        rotate([90])
            cylinder(5, 2, 2);
    // side hole
    translate([
        w - wall_h -1,
        w / 2,
        h / 2
    ])
        rotate([0, 90])
            cylinder(5, 2, 2);
}