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
module piece(width) {
    wall();
    translate([0,0,4.5])
        body(width - 9);
    translate([0, 0, width -5])
        wall();
}
$fn=100;
module a3(width = 60, topScrews = false) {
    rotate([0, -90, 0])
        difference() {
            piece(width);
            
            // right pin hole
            translate([13, 36, -9])
                cylinder(18, d=5);
            // right screw hole
            translate([10, 26, -2])
                cylinder(12, d=3); 
            // left pin hole
            translate([13, 36, width - 9])
                cylinder(18, d=5);
            // left screw hole
            translate([10, 26, width - 8])
                cylinder(12, d=3); 
            // top screws
            screwCount = ceil((width - 50) / 50);
            initial = (width - ((screwCount - 1) * 50)) / 2;
            echo(screwCount, initial);
            
            if (topScrews) {
                rotate ([0, 90, 0]) {
                    for(screwx = [0 : 1 : screwCount - 1]) {
                        translate([-initial + screwx * -50, 15, -2.5])
                        #cylinder(h=10, d=3);
                    }
                }
            }
        }
    }
 a3(110, true);