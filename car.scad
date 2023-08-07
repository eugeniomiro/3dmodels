$fa = 1;
$fs = 0.4;
// car body base
cube([60, 20, 10], center=true);
// car body top
translate([5,0,10])
    cube([30, 20, 10], center=true);
// body-cabin connection
translate([0,0,5])
    cube([30, 20, 0.002], center=true);
// left-front wheel
translate([-20,-15,0])
    rotate([90,0,0])
        cylinder(h=3, r=8, center=true);
// right-front wheel
translate([-20,15,0])
    rotate([90,0,0])
        cylinder(h=3, r=8, center=true);
// left-rear wheel
translate([20,-15,0])
    rotate([90,0,0])
        cylinder(h=3, r=8, center=true);
// right-rear wheel
translate([20,15,0])
    rotate([90,0,0])
        cylinder(h=3, r=8, center=true);
// rear axle
translate([20,0,0])
    rotate([90,0,0])
        cylinder(h=30, r=2, center=true);
// front axle
translate([-20,0,0])
    rotate([90,0,0])
        cylinder(h=30, r=2, center=true);
