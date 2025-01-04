module body(length = 5) {
    linear_extrude(length) {
        polygon([
         [  11,   0],  // base derecha
         [  14,   5],
         [  14,  11],
         [  21,  18],
         [  18,  21],
         [   4, 8.5],
         [   2,10.5],
         [ 8.5,16.5],
         [ 3.5,  21],
        
         [-3.5,  21],        
         [-8.5,16.5],
         [  -2,10.5],
         [  -4, 8.5],
         [ -18,  21],
         [ -21,  18],
         [ -14,  11],
         [ -14,   5],
         [ -11,   0]   // base izquierda
        /*
            [ 0, 16], //  1
            [ 0, 21], //  2
            [14, 35], //  3
            [19, 35], //  4
            [25, 30], //  5
            [35, 30], //  6
            [35, 25], //  7
            [17, 25], //  8 +4
            [17, 21], //  9
            [25, 21], // 10
            [25, 15], // 11
            [20, 10], // 12
            [14, 10], // 13 *
            [14, 18], // 14
            [10, 18], // 15
            [10,  0], // 16
            [ 5,  0], // 17
            [ 5, 11]  // 18
*/
        ]);
    }
}

$fn = 100;

module pin() {
    cylinder(h=20, d=5);
}
module piece(width) {
    difference() {
        rotate([90, 0, 0])
            body(width);
            rotate([90, 0, 0]) {
                translate([0, 6, -10])
                    pin();
                translate([0, 16, -10])
                    pin();
                translate([0, 6, width-10])
                    pin();
                translate([0, 16, width-10])
                    pin();
            }
    }
}
module b3(width, topScrews = false) {
    difference() {
        piece(width);
        
        screwCount = ceil((width - 50) / 50);
        initial = (width - ((screwCount - 1) * 50)) / 2;
        echo(screwCount, initial);
        
        if (topScrews) {
            for(screwx = [0 : 1 : screwCount - 1]) {
                rotate ([45, 0, 90]) {
                    translate([-initial + screwx * -50, 22, -5])
                        #cylinder(h=10, d=3);
                }
                rotate ([135, 0, 90]) {
                    translate([-initial + screwx * -50, 22, -5])
                        #cylinder(h=10, d=3);
                }
            }
        }
    }
}

b3(224, true) {
}