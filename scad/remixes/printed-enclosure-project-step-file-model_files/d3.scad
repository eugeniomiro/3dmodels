
module body(length = 5) {
    linear_extrude(length) {
        polygon([
            [ 12.5, 0],
            [ 12.5, 5],
            [  7.5, 10],
            [  1,   10],
            [  1,  1.5],
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
                translate([ 6, 5, -10])
                    pin();
                translate([-6, 5, -10])
                    #pin();
                translate([ 6, 5, width-10])
                    pin();
                translate([-6, 5, width-10])
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

d3(25, true);