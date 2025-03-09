module e_profile() {
    polygon(
    [[ 0,  0],
     [ 0, 25],
     [ 2, 25],
     [ 2, 17],
     [ 5, 17],
     [ 5, 35],
     [10, 35],
     [10, 25],
     [15, 20],
     [15, 15]
    ]);
}
module body(length) {
rotate([45, 0, 0])
    rotate([0,90,0])
        linear_extrude(length)
            e_profile();
}
length                 = 221;
top                    = true;
long                   = length > 180;
distance_between_holes = 65;
shift                  = 6.3;
echo (top, long, length);

difference() {
    body(length + shift);
    if (long) {
        // magnet hole
        if (top){
            translate([7.5, 10, -2])
                #cylinder(4, d=10);
        } else {
            translate([-5, 20, -9])
                #cylinder(4, d=10);
        }
    } else {
        if (top) {
            // substract lock
            echo ("left top lock");
            translate([length - 25 + shift, sqrt(2) * 5, 0])
                rotate([45, 0, 0])
            translate([0, -sqrt(2) * 5, -20])
                rotate([0, 45, 0])
                    #cube(40);
        } else {
            // add lock
            echo ("left bottom lock");
            translate([-28.3, sqrt(2) * 5, 0])
                rotate([45, 0, 0])
            translate([0, -sqrt(2) * 5, -23.32])
                rotate([0, 45, 0])
                    #cube(40);
        }
    }
    rotate([0, 90, 0]){
        // 
        if (top) {
            translate([-5, 20, -9])
                #cylinder(18, d=5, $fn=100);
        } 
        if (top || long)
        {        
            translate([-5, 20, -9 + length + shift])
                #cylinder(18, d=5, $fn=100);
        }
    }
    screwCount = ceil((length - distance_between_holes  / 2) / distance_between_holes);
    initial    = (-length - ((screwCount - 1) * distance_between_holes)) / 2;
    for(screwx = [0 : 1 : screwCount - 1]) {
        rotate ([45, 0, 0]) {
            translate([-initial + screwx * -distance_between_holes, 30, -10])
                cylinder(h=10, d=3, $fn = 100);
        }
    }
}
