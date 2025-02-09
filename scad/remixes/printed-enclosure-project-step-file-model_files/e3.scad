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
difference() {
    length = 170;
    body(length);
    rotate([0, 90, 0]){
    translate([-5, 20, -9])
        #cylinder(18, d=5, $fn=100);
    translate([-5, 20, -9+length])
        #cylinder(18, d=5, $fn=100);
    }
}