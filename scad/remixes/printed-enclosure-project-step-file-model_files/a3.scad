module wall(){
    linear_extrude(5) {
        polygon([
            [ 0,  0],
            [ 0, 41],
            [15, 55],
            [20, 55],
            [25, 50],
            [35, 50],
            [35, 45],
            [17, 45],
            [17, 41],
            [25, 41],
            [25, 35],
            [ 5, 15],
            [ 5,  0]
        ]);
    }
}
module body(size) {
    linear_extrude(size)
        polygon([
            [ 0,  0],
            [ 0, 41],
            [15, 55],
            [20, 55],
            [25, 50],
            [35, 50],
            [35, 45],
            [17, 45],
            [17, 41],
            [25, 41],
            [25, 35],
            [20, 30],
            [ 5, 30],
            [ 5,  0]
        ]);
}
module piece() {
    wall();
    translate([0,0,4.5])
        body(51);
    translate([0,0,55])
        wall();
}
$fn=100;
rotate([0,-90,0])
    difference() {
        piece();
        translate([13, 36, -9])
            cylinder(18, d=5);
        translate([10, 26, -2])
            cylinder(12, d=3); 
        translate([13, 36, 51])
            cylinder(18, d=5);
        translate([10, 26, 52])
            cylinder(12, d=3); 
    }