wallWidth = 3;
totalWidth = 50;
totalHeight = 50;
totalDepth = 50;

// pared trasera
cube([totalWidth,wallWidth,totalHeight]);
// pared lateral
translate([totalWidth,0,0])
    rotate([0,0,90])
        cube([totalDepth,wallWidth,totalHeight]);
// base
translate([0,totalDepth,0])
    rotate([90, 0, 0])
        cube([totalWidth,
              wallWidth,
              totalDepth]);
// canaleta trasera
translate([0,
           wallWidth*2,
           wallWidth*2])
    rotate([0,90,0])
        cube([wallWidth, 
              wallWidth, 
              totalWidth - 2 * wallWidth]);
// canaleta lateral
translate([totalWidth - 3*wallWidth,
           totalDepth,
           wallWidth])
    rotate([90,0,0])
        cube([wallWidth, 
              wallWidth, 
              totalDepth - (2 * wallWidth)]);
//relleno canaletas
cube(3);