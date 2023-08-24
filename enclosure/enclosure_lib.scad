module SimpleCorner(wallWidth = 3,
                    totalWidth = 50,
                    totalHeight = 50,
                    totalDepth = 50,
                    gutterWidth = 3)
{
    // back wall
    cube([totalWidth,wallWidth,totalHeight]);
    // side wall
    translate([totalWidth,0,0])
        rotate([0,0,90])
            cube([totalDepth,wallWidth,totalHeight]);
    // base
    translate([0,totalDepth,0])
        rotate([90, 0, 0])
            cube([totalWidth,
                  wallWidth,
                  totalDepth]);
    // back gutter
    translate([0,
               wallWidth + gutterWidth,
               wallWidth * 2])
        rotate([0,90,0])
            cube([wallWidth, 
                  wallWidth, 
                  totalWidth - wallWidth - gutterWidth]);
    // side gutter
    translate([totalWidth - 2 * wallWidth - gutterWidth,
               totalDepth,
               wallWidth])
        rotate([90,0,0])
            cube([wallWidth, 
                  wallWidth, 
                  totalDepth - wallWidth - gutterWidth]);
    // gutter fill
    cube(3);
}
module Cone(holeRadius = 3)
{
    centerRadius    = 3;
    centerHeight    = 2;
    masterRadius    = 18;
    totalHeight     = 3;
    tanAlpha        = totalHeight / (masterRadius - centerRadius);
    holeHeight      = tanAlpha * (masterRadius - holeRadius);
    rotate_extrude()
        polygon(points=[
            [0, 0],
            [masterRadius, 0],
            [holeRadius, holeHeight],
            [holeRadius, 1],
            [0, 1]
        ]);
}
module Base(width = 50,
       depth = 50,
       halfHeight = 3)
{
    cube([width, depth, halfHeight]);
    translate([width / 2, depth / 2, halfHeight])
        Cone(3.5);
}

module BasedCorner(wallWidth = 3,
                   width = 50,
                   height = 50,
                   depth = 50,
                   gutterWidth = 3.4)
{
    translate([0, 0, wallWidth])
        union() {
            SimpleCorner(wallWidth, 
                         width, 
                         height - wallWidth, 
                         depth,
                         gutterWidth);
            translate([0,0, -wallWidth])
                difference() {
                    cube([width, depth, wallWidth]);
                    translate([width/2, depth/2, -.01])
                        Cone();
            }
        }
}

module top_profile(gutterWidth = 3) 
{
    polygon([
        [0, 0],
        [0, 9],
        [6, 9],
        [6, 6],
        [21,6],
        [21,3],
        [6 + gutterWidth, 3],
        [6 + gutterWidth, 0],
        [3 + gutterWidth, 0],
        [3 + gutterWidth, 3],
        [3, 3],
        [3, 0],
    ]);
}

import("/home/eugenio/repos/3dmodels/enclosure/leg_based_enclosure__.stl");
import("/home/eugenio/repos/3dmodels/enclosure/leg_based_enclosure__.stl");
