wallWidth = 3;
totalWidth = 50;
totalHeight = 50;
totalDepth = 50;

// pared trasera
translate([0,0,25])
    cube([50,wallWidth,50], center=true);
// pared lateral
translate([25,25,25])
    rotate([0,0,90])
        cube([50,wallWidth,50], center=true);
// base
translate([0,25,wallWidth/2])
    rotate([90, 0, 0])
        cube([50,
              wallWidth,
              50], center=true);
// canaleta trasera
translate([(-wallWidth*0.9),
           wallWidth*2.1,
           wallWidth])
    rotate([0,90,0])
        cube([wallWidth, 
              wallWidth, 
              totalWidth - 1.5 * wallWidth],
             center=true);
// canaleta lateral
translate([totalDepth/2 - 2.1 * wallWidth,
           totalDepth/2 + wallWidth,
           wallWidth])
    rotate([90,0,0])
        cube([wallWidth, 
              wallWidth, 
              totalWidth - (2 * wallWidth)],
             center=true);
