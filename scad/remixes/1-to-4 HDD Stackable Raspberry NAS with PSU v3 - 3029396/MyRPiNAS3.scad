/*[ Visibility ]*/
// enable PSULayer
enablePSU = true;
// enable outside walls
enableOutsideWalls = false;
// enable outside columns
enableOutsideColumns = true;
// enable HDD tray
enabledHDDTray = true;
// enable RPI Cover
enableRPICover = true;
// enable RPI Tray
enableRPITray = true;

/*[Adaptors]*/
// Selected HDD Adaptor
SelectedAdaptor = 1;    // [1:"SATA/USB Adaptor (original design)", 2:"BELSIC USB 3.0 Adaptor" ]

// M2 screws
module M2Screw(length=5) {
    union() {
        cylinder(length,0.95,0.95,$fn=40);
        #translate([0,0,-10])
            cylinder(10,2,2,$fn=40);
    }
}
// CoverScrews
module CoverScrews() {
  translate([-3,5,0])
      rotate([0,90,0])
          M2Screw(6);
  translate([-3,140,0])
      rotate([0,90,0])
          M2Screw(6);
  translate([98,5,0])
      rotate([0,-90,0])
          M2Screw(6);
  translate([98,140,0])
      rotate([0,-90,0])
          M2Screw(6);
}

// M2 Screw bases
module M2ScrewBase(x,y) {
    translate([x,y,0])
        difference() {
            cylinder(6,2.5,2.5,$fn=40);
            translate([0,0,3])
                cylinder(5,.95,.95,$fn=40);
        };
};

// M3 Screw bases
module M3ScrewBase(x,y) {
    translate([x,y,0])
        difference() {
            cylinder(7,2.5,2.5,$fn=40);
            translate([0,0,3])
                cylinder(5,1.45,1.45,$fn=40);
        };
};


// PSU layer
module PSULayer() {
    color ("Beige")
    translate([0,0,0])
        union() { 
            M3ScrewBase(47.5-67/2,138);
            M3ScrewBase(47.5+67/2,138);
            M3ScrewBase(47.5-67/2,138-103);
            M3ScrewBase(47.5+67/2,138-103);
            difference() {
                cube([95,145,45]);
                // Inside
                translate([3,3,3])
                    cube([89,139,50]);
                // Air vents
                for(nb = [1 :1 : 11]) {
                    // Side
                    translate([-1,nb*10+17,3])
                        cube([100,5,35]);
                    // Bottom center
                    translate([37.5-19,nb*10+17,-1])
                        cube([58,5,5]);
                }
                // Power cord
                translate([30,-5,25])
                    rotate([-90,0,0])
                        cylinder(10,4,4);
                // Main power switch
                translate([60,-5,18])
                    cube([9,10,14]);
                // External screws
                translate([0,0,5])
                    CoverScrews();
            }
        };
}
// outside
module OutsideWalls() {
    translate([-3,-3,-3])
    difference(){
        cube([101,151,133]);
        translate([3,3,3])
            cube([95,145,127]);
        translate([0,12,3])
            cube([101,127,130]);
        translate([9,0,3])
            cube([81,151,127]);
        translate([3,3,125])
            CoverScrews();
        translate([9,9,-3])
            cube([83,133,10]);
    };
}

// outside 2
// Columns instead of walls
// Extended NAS location by 2x2
// Added Fan block
module OutsideColumns() {
    translate([-3,-3,-3])
        difference() {
            union(){
                translate ([-27,0,0]) cube([103+27,151,3]);  // Base
                translate ([-3-27,0,0]) cube([33,151,130]);  // Fan block
                translate ([3-27,3,0]) cylinder(130,10,10);
                translate ([3-27,147,0]) cylinder(130,10,10);
                translate ([0,3,0]) cylinder(130,10,10);
                translate ([0,147,0]) cylinder(130,10,10);
                translate ([99,3,0]) cylinder(130,10,10);
                translate ([99,147,0]) cylinder(130,10,10);
            };
            translate([-27,14,3]) cube([27,122,130]); // Fan
            translate([-31,24,3]) cube([35,102,130]); // Fan vents
            translate([3,2,3]) cube([97,147,128]);    // NAS
        };
}

// RPi cover
module RPICover() {
    color("Moccasin")
    translate([0,0,78+13*3])
        union() {
            difference() {
                cube([95,145,10]);
                // Network cable
                translate([63,-1,0])
                    cube([10,10,7]);
                // Inside
                translate([3,3,-1])
                    cube([89,139,8]);
                // Air vents
                for(nb = [1 :1 : 14]) {
                    // Bottom right
                    translate([5,nb*10-3,6])
                        cube([13,5,5]);
                    // Bottom center
                    translate([47.5-19,nb*10-3,6])
                        cube([38,5,5]);
                    // Bottom left
                    translate([77,nb*10-3,6])
                        cube([13,5,5]);
                }
                translate([0,0,5])
                    CoverScrews();
            }
        };
}

// RPi Tray
module RPITray() {
    color ("PapayaWhip")
    translate([0,0,58])
        union() {
            difference() {
                cube([95,145,20]);
                // Inside
                translate([3,3,3])
                    cube([89,139,18]);
                // Cable back sink
                translate([28,5,-0.5])
                    cube([63,15,4]);
                // Air vents
                for(nb = [1 :1 : 11]) {
                    // Side
                    translate([-1,nb*10+17,3])
                        cube([100,5,20]);
                    // Bottom right
                    translate([5,nb*10+17,-1])
                        cube([13,5,5]);
                    // Bottom center
                    translate([47.5-19,nb*10+17,-1])
                        cube([38,5,5]);
                    // Bottom left
                    translate([77,nb*10+17,-1])
                        cube([13,5,5]);
                }
                // HDMI hole
                translate([-1,99,3])
                    cube([10,22,20]);
                // SDCard
                translate([47.5-7.5,140,4])
                    cube([15,10,3]);
                // Leds
               translate([47.5+18,150,8])
                    rotate([90,0,0])
                        scale([5,1,1])
                            cylinder(10,1,1,$fn=40);
            }
            // Screws
            M2ScrewBase(47.5-24.5,138);
            M2ScrewBase(47.5+24.5,138);
            M2ScrewBase(47.5-24.5,80);
            M2ScrewBase(47.5+24.5,80);
        };
}
// HDD tray
module HDDTray(AdaptorType=1) {
    
translate([0,0,45])
    difference() {
        cube([95,145,13]);
        
        translate([8.5,57,3])
            union() {
                // HDD
                translate([-0.5,-0.01,0])
                    cube([71,100,8]);
                // HDD under hole
                translate([5,5,-4])
                    cube([60,90,10]);
                // HDD over hole
                translate([-0.5,5,1])
                    cube([71,90,10]);
                // HDD air vents
                for(nb = [1 :1 : 7]) {
                    translate([-10,nb*10,0])
                        cube([100,5,12]);
                }
                if (AdaptorType == 1) {
                    // SATA/USB Adaptor
                    translate([6,-19,-2])
                        union() {
                            // Main body
                            cube([47,19,13]);
                            // Back
                            translate([5,-19,0])
                                cube([37,20,13]);
                        }
                    // Cable back sink
                    translate([20,-52,-3.01])
                        cube([63,15,15]);
                } else {
                    translate([-0.5,-22,-2])
                        union() {
                            cube([71, 22, 100]);
                            translate([5,-40,1])
                                cube([18,50,9]);
                        }
                    // Cable back sink
                    translate([22,-52,-3.01])
                        cube([63,15,15]);
                }
                // Cable room
                translate([73,-52,0])
                    cube([10,130,13]);
            };
    }
}


if (enablePSU)
    PSULayer();
if (enableOutsideWalls)
    OutsideWalls();
if (enableOutsideColumns)
    OutsideColumns();
if(enableRPICover)
    RPICover();
if (enableRPITray)
    RPITray();
if (enabledHDDTray)
    HDDTray(SelectedAdaptor);
