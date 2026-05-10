singleCap = 42.5;
numCaps = 3;

// pared
    translate([-singleCap * numCaps / 2, 0, 0])
        cube([singleCap * numCaps, 150, 2], center = true);

// base 
    translate([-1, 0, 3])
        cube([2, 150, 8], center = true);
        
// techo
    translate([(-singleCap * numCaps) + 1, 0, 3])
        cube([2, 150, 8], center = true);

// flanco izquierdo
    rotate([0, 0, 90])
        translate([-74, singleCap * numCaps / 2, 3])
            cube([2, singleCap * numCaps, 8], center = true);

// flanco derecho
    rotate([0, 0, 90])
        translate([74, singleCap * numCaps / 2, 3])
            cube([2, singleCap * numCaps, 8], center = true);

// traba derecha inferior
    translate([-32, 73, 0])
        cube([20, 2, 20]);
    translate([-32 - 41, 73, 18])
        rotate([90, 0, 90])
            traba();
        
// traba derecha central
    translate([-32 -41, 73, 0])
        cube([20, 2, 20]);
    translate([-32, 73, 18])
        rotate([90, 0, 90])
            traba();

// traba derecha superior
    translate([-32 -41 * 2, 73, 0])
        cube([20, 2, 20]);
    translate([-32 -41 * 2, 73, 18])
        rotate([90, 0, 90])
            traba();

// traba izquierda inferior
    translate([-32, -75, 0])
        cube([20, 2, 20]);
    translate([-12, -73, 18])
        rotate([90, 0, -90])
            traba();
        
// traba izquierda central
    translate([-32 -41, -75, 0])
        cube([20, 2, 20]);
    translate([-10 -43, -73, 18])
        rotate([90, 0, -90])
            traba();

// traba izquierda superior
    translate([-32 -41 * 2, -75, 0])
        cube([20, 2, 20]);
    translate([-10 -42 * 2, -73, 18])
        rotate([90, 0, -90])
            traba();

// traba

module traba()
{
linear_extrude(20)
    polygon([
        [0,0],
        [0,2],
        [2,2],
        [4,0]
    ]);
}