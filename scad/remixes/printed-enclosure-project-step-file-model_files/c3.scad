module wall(){
    linear_extrude(5) {
        polygon([
            [ 0,  0],
            [ 0, 41],
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
module c3(width = 60, topScrews = 50, magnetHoles = 10) {
    difference() {
        piece(width);
        
        // right pin hole
        translate([7.5, 36, -9])
            cylinder(18, d=5);
        // right screw hole
        translate([10, 26, -2])
            cylinder(12, d=3); 
        // left pin hole
        translate([7.5, 36, width - 9])
            cylinder(18, d=5);
        // left screw hole
        translate([10, 26, width - 8])
            cylinder(12, d=3); 
        // top screws
        screwCount = ceil((width - topScrews) / topScrews);
        initial = (width - ((screwCount - 1) * topScrews)) / 2;
        echo(screwCount, initial);
        
        if (topScrews != 0) {
            rotate ([0, 90, 0]) {
                for(screwx = [0 : 1 : screwCount - 1]) {
                    translate([-initial + screwx * -topScrews, 15, -2.5])
                    cylinder(h=10, d=3);
                }
            }
        }
        if (magnetHoles != 0) {
            translate([10, 43, width/2 - 10 + magnetHoles])
                rotate([90, 0, 0])
                    #cylinder(h=4, d=10);
            translate([10, 43, width/2 + 10 + magnetHoles])
                rotate([90, 0, 0])
                    #cylinder(h=4, d=10);
        }
    }
}

rotate([0, -90, 45])
    c3(360, 65);