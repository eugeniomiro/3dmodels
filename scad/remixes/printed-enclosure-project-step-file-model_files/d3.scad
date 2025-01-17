
module body(length = 5) {
    linear_extrude(length) {
/*        polygon([
         [   8,  -1],  // base derecha
         [  14,   5],
         [  14,  11],
         [  21,  18],
         [  18,  21],
         [ 4.5, 8.5],
         [   2,10.5],
         [ 8.5,16.5],
         [ 3.5,  21],
        
         [-3.5,  21],        
         [  -8,16.5],
        ]);
*/
        polygon([
            [ 12.5, 0],
            [ 12.5, 5],
            [  7.5, 10],
            [  1.5, 10],
            [  1.5,1.5],
            [ -2.5,1.5],
            [ -2.5, 20],
            [ -7.5, 20],
            [ -7.5, 10],
            [-12.5, 5],
            [-12.5, 0]
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
                translate([ 7, 5, -10])
                    #pin();
                translate([-7, 5, -10])
                    #pin();
                translate([ 7, 5, width-10])
                    #pin();
                translate([-7, 5, width-10])
                    #pin();
            }
    }
}
module d3(width, topScrews = false) {
    difference() {
        piece(width);
        
        screwCount = ceil((width - 50) / 50);
        initial = (width - ((screwCount - 1) * 50)) / 2;
        
        if (topScrews) {
            for(screwx = [0 : 1 : screwCount - 1]) {
                rotate ([90, 0, 90]) {
                    translate([-initial + screwx * -50, 15, -10])
                        #cylinder(h=10, d=3);
                }
            }
        }
    }
}

d3(223, true) {
}