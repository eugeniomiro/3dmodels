module body(length = 5) {
    linear_extrude(length) {
        polygon([
         [  11,   0],  // base derecha
         [  14,   5],
         [  14,  11],
         [  21,  18],
         [  18,  21],
         [ 4.5, 8.5],
         [   2,10.5],
         [ 8.5,16.5],
         [ 3.5,  21],
        
         [-3.5,  21],        
         [-8.5,16.5],
         [  -2,10.5],
         [-4.5, 8.5],
         [ -18,  21],
         [ -21,  18],
         [ -14,  11],
         [ -14,   5],
         [ -11,   0]   // base izquierda
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

b3(223, true) {
}