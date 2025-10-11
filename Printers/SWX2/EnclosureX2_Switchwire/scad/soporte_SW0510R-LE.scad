include<extrusion_lock.scad>

PSU_side_support_height                 = 1;    // this is the height of the plate that is attached to the PSU
PSU_screw_hole_diameter                 = 3.5;  // this is the hole for the screws that hold the PSU plate
PSU_support_width                       = 160;
PSU_screw_head_diameter                 = 6;    //
support_hole_diameter                   = 5.5;
support_depth                           = 42;
PSU_side_support_border_sphere_width    = 4;
extrusion_side_support_height           = 14;
extrusion_side_support_depth            = 10.11;

PSU_extrusion_screw_hole_length = extrusion_side_support_height + PSU_side_support_border_sphere_width;

difference(){
    union() {
        // PSU side support
        translate([0, 0, PSU_side_support_border_sphere_width / 2]) {
        minkowski() {
                cube([PSU_support_width - PSU_side_support_border_sphere_width * 2, 
                      support_depth - PSU_side_support_border_sphere_width * 2,
                      PSU_side_support_height]);
                sphere(d=PSU_side_support_border_sphere_width, $fn=50);
            }
        }
        // Extrusion side support
        translate([-20, support_depth / 2 - 8, 0]) {
            linear_extrude(extrusion_side_support_height)
                hull() {
                    translate([200, 0, 0])
                        circle(extrusion_side_support_depth);
                    circle(extrusion_side_support_depth);
                }
        }
    }
    // left extrusion screw hole
    translate([-20, support_depth / 2 - 8, -1]){
        cylinder(PSU_side_support_height + 15, d=support_hole_diameter, $fn=50);
    }
    // right extrusion screw hole
    translate([180, support_depth / 2 - 8, -1]){
        cylinder(PSU_side_support_height + 15, d=support_hole_diameter, $fn=50);
    }
    // left PSU screw head housing
    translate([22, support_depth / 2 - 3, 7]){
        cylinder(PSU_side_support_height + 15, d=PSU_screw_head_diameter, $fn=50);
    }
    // left PSU screw head housing
    translate([22, support_depth / 2 - 3, -1])
        cylinder(PSU_side_support_height + 15, d=PSU_screw_hole_diameter, $fn=50);
    // right-top PSU screw hole
    translate([PSU_support_width - 20, 27, -1])
        cylinder(PSU_side_support_height + 15, d=PSU_screw_hole_diameter, $fn=50);
    // right-bottom PSU screw hole
    translate([PSU_support_width - 20, 9, -1])
        cylinder(PSU_side_support_height + 15, d=PSU_screw_hole_diameter, $fn=50);
    // right-bottom PSU screw head housing
    translate([PSU_support_width - 20, 9, 7]){
        cylinder(PSU_side_support_height + 15, d=PSU_screw_head_diameter, $fn=50);
    }
}

translate([130,extrusion_side_support_depth - 2,extrusion_side_support_height])
//translate([extrusion_side_support_height, extrusion_side_support_depth - 2, -130])
    extrusion_lock(100);
