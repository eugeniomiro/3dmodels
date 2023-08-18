module SimpleCorner(wallWidth = 3,
                    totalWidth = 50,
                    totalHeight = 50,
                    totalDepth = 50)
{
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
}
module Cone()
{
    rotate_extrude()
        polygon(points=[
            [0, 0],
            [18, 0],
            [3, 3],
            [3, 1],
            [0, 2]
        ]);
}
module Base(width = 50,
       depth = 50,
       halfHeight = 3)
{
    cube([width, depth, halfHeight]);
    translate([width / 2, depth / 2, halfHeight])
        Cone();
}

module BasedCorner(wallWidth = 3,
                   width = 50,
                   height = 50,
                   depth = 50)
{
    translate([0, 0, wallWidth])
        union() {
            SimpleCorner(wallWidth, 
                         width, 
                         height - wallWidth, 
                         depth);
            translate([0,0, -wallWidth])
                difference() {
                    cube([width, depth, wallWidth]);
                    translate([width/2, depth/2, -.01])
                        Cone();
            }
        }
}

printBasedCorner = true;
printSimpleCorner = true;
printBase = true;
wall_h=3;
h=50;
d=50;
w=50;

if(printBase) {
    Base(w, d, wall_h);
}
if(printBasedCorner) {
    translate([0, 55, 0])
        BasedCorner(wall_h, w, h, d);
}
if(printSimpleCorner) {
    translate([-55, 0, 0])
        SimpleCorner(wall_h, w, h, d);
}
