$fn=32;

//type = "full";  // Preview with ssd
//type = "bracket";   // Bracket without mounting points
type = "print";

space=0.2;
baseT=2.4;  // Base thickness - should be < ssdZPos
baseW=3;    // Width of base frame lines
wallT=2;    // Side wall thickness


hddW=101.6;
hddL=147;
hddH=26.1;
hddHolesP=[28.5,28.5+41.61,28.5+101.6];
hddHolesH=baseT+6.35;
hddHolesD=3;

ssdW=69.85;
ssdL=100.2;
ssdH=7;
ssdHolesDiff=76.2;
ssdHolesP=14;
ssdHolesH=3;
ssdHolesD=0.5;
ssdZPos=baseT+2;
ssdLPos=0;
ssdFullH=ssdH+wallT*1.5+ssdZPos;


/* 2.5 inch: Outer measure 2.75 in × 0.275–0.59 in × 3.945 in
(69.85 mm × 7–15 mm × 100 mm).
3.5 inch: Outer measure 4 in × 1 in × 5.75 in
(101.6 mm × 25.4 mm × 146 mm). 
*/

wallH=hddH;

// Bracket
bracRad=12;
shift=bracRad*0.2;

// Lock
lockH=ssdFullH-ssdZPos+space;
lockD=bracRad*0.55;
lockP=bracRad*0.2;
lockW=lockD/2*sqrt(3);
catchD=lockW*1.2;

// SSD Connector
ssdConW=47;
ssdConPos=6;
ssdConH=lockH;
overlap=0.1;

// Outer frame (HDD inner dimensions)
module hddPos() {
    translate([hddL/2,0,hddH/2]) cube([hddL,hddW,hddH], center=true);
}

module hddMount() {
    ridge=0.5;
    diam=wallH*1.5;
    ridgeT=wallT*2;
    for(x=hddHolesP) translate([x,hddW/2,0]) rotate([90,0,0])  rotate([0,0,90]) difference() {
        linear_extrude(height=ridgeT,center=false,$fn=3) offset(r=ridge) circle(d=diam,$fn=3);
        translate([0,0,ridgeT+wallT]) mirror([0,0,1]) linear_extrude(height=ridgeT,scale=0.5,center=false,$fn=3) offset(r=ridge) offset(r=-ridge*2) circle(d=diam,$fn=3);
    }
}

module hddHolesNeg() {
    for(x=hddHolesP) translate([x,hddW/2-wallT/2,hddHolesH]) rotate([90,0,0]) rotate([0,0,22.5]) cylinder(h=wallT*2,d=hddHolesD,center=true,$fn=8);
}


module hddFrame() {
    hh=wallH*0.25;
    intersection() {
        hddPos();
        difference() {
            union() {
                //translate([hddL/2,0,baseT/2]) cube([hddL,hddW,baseT], center=true);
                translate([hddL-wallT/2,0,hh/2]) cube([wallT,hddW,hh], center=true);
                translate([hddL/2,0,0]) base();
                for(i=[0,1]) mirror([0,i,0]) {
                    translate([hddL/2,hddW/2-wallT/2,hh/2]) cube([hddL,wallT,hh], center=true);
                    hddMount();
            }
        }
        
        // Mounting holes
        for(i=[0,1]) mirror([0,i,0]) hddHolesNeg();
        }
    }
}

module ray(p1,p2) {
    rad = norm(p2-p1);
    dx = p2[0] - p1[0];
    dy = p2[1] - p1[1];
    zrot = atan2(dy,dx);
    translate((p1+p2)/2) rotate([0,0,zrot]) cube(size=[rad,raythick,zheight], center= true);
}

module ray(p1,p2,raythick=baseW,zheight=baseT) {
    rad = norm(p2-p1);
    dx = p2[0] - p1[0];
    dy = p2[1] - p1[1];
    zrot = atan2(dy,dx);
    translate((p1+p2)/2) rotate([0,0,zrot]) linear_extrude(height=zheight,scale=1,center=false) union()
    {
        for(x=[-1,1]) translate([x*rad/2,0,0]) circle(d=raythick);
        square([rad,raythick], center= true);
    }
    //cube([rad,raythick,zheight], center= true);
}

module triangle(i=0,P) {
    tri= [
        for(i=[0:len(P)-1])
            let(ni=(i+1) % len(P))
        (P[i]+P[ni])/2
    ];
    if ( i > 0 ) {
        for(p=[0:len(P)-1]) {
            np = (p+1) % len(P);
            pp = (p+2) % len(P);
            ray(p1=P[p],p2=P[np]); 
            triangle(i=i-1,P= [ (P[pp]+P[p])/2, P[p], (P[np]+P[p])/2 ]);     
        }
        triangle(i=i-1,P=tri);
    }
}

module base(xx=hddL-baseW,yy=hddW-baseW) {
    cnr=[ [-xx/2,yy/2], [xx/2,yy/2], [xx/2,-yy/2], [-xx/2,-yy/2] 
    ];
    cx = rands(-xx/3,xx/3,1)[0];
    cy = rands(-yy/3,yy/3,1)[0];
    for(p=[0:len(cnr)-1]) {
        np = (p+1) % len(cnr);
        triangle(i=3,P=[ [cx,cy], cnr[p], cnr[np] ]);
    }
}

// SSD with space
module ssdPos() {
    translate([ssdL/2+ssdLPos,0,ssdH/2+ssdZPos]) cube([ssdL+space*2,ssdW+space*2,ssdH+space*2], center=true);
    // Conn
    translate([ssdLPos,ssdConPos,ssdConH/2+ssdZPos]) cube([30,ssdConW+space*2,ssdConH+space*2], center=true);

}

// SSD with walls
module ssdWallsPos() {
    translate([ssdL/2+ssdLPos,0,ssdH/2+ssdZPos]) cube([ssdL+wallT*2,ssdW+wallT*2,ssdH+wallT*2], center=true);
    // Conn
    translate([ssdLPos,ssdConPos,ssdConH/2+ssdZPos]) cube([30,ssdConW+wallT*2,ssdConH+wallT*2], center=true);
}

module ssd() {
    difference() {
        union() {
            translate([ssdL/2+ssdLPos,0,ssdH/2+ssdZPos]) cube([ssdL,ssdW,ssdH], center=true);
            // Conn
            translate([ssdLPos,ssdConPos,ssdConH/2+ssdZPos]) cube([30,ssdConW,ssdConH+space*2+overlap*2], center=true);
        }
        for(i=[0,1]) for(p=[0,ssdHolesDiff]) mirror([0,i,0]) translate([ssdHolesP+p,ssdW/2,ssdZPos+ssdHolesH]) rotate([90,0,0]) cylinder(h=wallT*2,d=ssdHolesD,center=true);
    }
}

module ssdBracket() {
    color("blue") difference() {
        union() {
            // Corner
            for(y=[-1,1]) union() {
                translate([ssdL+ssdLPos-shift,y*(ssdW/2-shift),0]) difference() {
                   cylinder(h=ssdFullH,r=bracRad,center=false);
                   rotate([0,0,y*45]) translate([-bracRad*2,0,ssdFullH/2]) cube([bracRad*4,bracRad*4,ssdFullH+overlap*2],center=true);
                }
            // Middle
                 //color("green") translate([ssdL/2+ssdLPos,y*(ssdW/2-shift),0]) cylinder(h=ssdFullH*3,r=1,center=false);
                difference() {
                    translate([ssdL/2+ssdLPos,y*(ssdW/2-shift),0]) cylinder(h=ssdFullH,r=bracRad,center=false);
                    translate([ssdL/2+ssdLPos,y*(ssdW/2-2*bracRad/sqrt(2)+ssdH/2+space*2),0]) difference() {
                        translate([0,0,ssdZPos+ssdH/2]) rotate([45,0,0]) cube(bracRad*2,center=true);
                        translate([0,y*(bracRad*2+2*bracRad/sqrt(2)-ssdH/2-space),ssdZPos+ssdH/2]) cube(bracRad*4,center=true);
                        translate([0,0,ssdZPos-space-bracRad*2]) cube(bracRad*4,center=true);
                    }
                }
            // Locking
                translate([ssdLPos,y*(ssdW/2-shift),0]) cylinder(h=ssdZPos-space,r=bracRad,center=false);
                translate([ssdLPos,y*(ssdW/2-shift),0]) difference() {
                    cylinder(h=ssdFullH,r=bracRad,center=false);
                    translate([0,-y*(bracRad*2-shift-space),0]) cube(bracRad*4,center=true);
                    //translate([ssdLPos,y*(ssdW/2-2*bracRad/sqrt(2)+ssdH/2+space*2),ssdZPos+ssdH/2]) rotate([45,0,0]) cube(bracRad*2,center=true);
                }
            }    
        }

        ssdPos();
        latch_neg();
    }
    
    latch();
}

module lock() {
    difference() {
        for(y=[-1,1]) translate([ssdLPos,y*(ssdW/2-shift),ssdZPos-space]) union() {
         //color("green") cylinder(h=ssdFullH*3,r=0.2,center=false);
         //color("red") translate([0,y*(shift+space),0]) cylinder(h=ssdFullH*3,r=0.2,center=false);
            
            translate([-lockP,y*(shift+space),0]) linear_extrude(height=lockH,center=false,convexity=4) rotate([0,0,30*y]) circle(d=lockD,$fn=3);
        // Locking

            difference() {
                color("orange") cylinder(h=lockH,r=bracRad-overlap,center=false);
                translate([bracRad*2,0,0]) cube(bracRad*4,center=true);
                translate([0,y*(bracRad*2+shift+space),0]) cube(bracRad*4,center=true);

            }
        }      
        translate([ssdLPos,ssdConPos,ssdConH/2+ssdZPos-overlap/2]) cube([30,ssdConW+space*2,ssdConH+space*2+overlap], center=true);
    }
}

module latch_neg() {
    for(y=[-1,1]) translate([ssdLPos,y*ssdW/2,0]) union() {
        translate([-lockP,y*(space+lockW/2+lockD/4),baseT]) linear_extrude(height=ssdFullH,center=false,convexity=4) square([lockW+space*2,lockW+overlap*2],center=true);
        translate([-lockP,y*space,ssdZPos-space]) linear_extrude(height=lockH+overlap,center=false,convexity=4) offset(r=space) rotate([0,0,30*y]) circle(d=lockD,$fn=3);
    }
}

module latch(sp=0) {
    for(y=[-1,1]) translate([ssdLPos-lockP,y*(ssdW/2+space+lockW/2+lockD/4),0]) union() {
        translate([0,0,(ssdFullH-baseT-overlap+catchD*0.5)/2+baseT]) cube([lockW,lockW/2,ssdFullH-baseT+overlap+catchD*0.5],center=true);
        translate([0,0,ssdFullH+catchD*0.3]) difference() {
            rotate([0,90,0]) cylinder(h=lockW,d=catchD,center=true);
            translate([0,y*(catchD*2+lockW/4),0]) cube(catchD*4,center=true);
        }
    }
}

if ( type == "full" ) {
    hddFrame();
    %color("grey") ssd();
    lock();
    ssdBracket();
} else if ( type == "bracket" ) {
    hddFrame();
} else {
    hddFrame();
    ssdBracket();
    translate([hddL/3,hddW/2+10+lockD,0]) translate([0,0,(ssdZPos-space+lockH)]) rotate([180,0,90]) lock();
}

