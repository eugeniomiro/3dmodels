use <enclosure_lib.scad>

$fn=50;
wall_h = 3;
h=50;
d=50;
w=50;
gutter_width=3.4;

difference() {
    BasedCorner(wall_h, w, h, d, gutter_width);
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