$fn = 10;

//radius of lab tube
//thick =7.75;  //real radius of lab tube
thick = 8.2;    //radius slightly bigger
spaceX = 17.5;  //space in X axis
spaceY = 25;    //space in Y axis

rows = 3;   //number of rows (Y axis)
columns = 10;   //number of collumns (X axis)

//filtering the part...1-will be rendered
Bottom = 1;
Upper = 1;
Corner = 1;

module tube()   //model of tube
{
    union(){
        rotate_extrude(convexity = 10){
            union()
            {
                translate([0,7.75,0]) square([thick,77.5-7.75]);
                translate([0,77.5,0]) square([8.5,3]);
                difference()
                {
                    difference()
                    {
                        translate([0,7.75,0]) circle(7.75);
                        translate([-7.75,0,0]) square([7.75,7.75*2]);
                    }
                    translate([0,7.75,0]) square(7.75);
                }
            }
        }
        translate([-4.5/2,0,77.5]) cube([4.5,13.5,3]);
        translate([0,-4.4,77.5]) cylinder(3,6,6);
    }
}

module slot()   //one row for tube
{
    for(i = [0:1:columns-1])
    {
        translate([spaceX/2+spaceX*i,0,0])
        {
            %tube();
            difference(){
                union(){
                    if(Upper) translate([0,0,40-0.5]) cube([spaceX,spaceY,1], center = true); //Upper part
                    if(Bottom){
                        translate([0,0,0.5]) cube([spaceX,spaceY,1], center = true); //Bottom part
                        translate([0,0,2]) cylinder(2,7,7, center= true); //spodni miska
                    }
                }
                tube();
            }
        }
    }
}

module  rail(z = 0) //side rails
{
    translate([0,spaceY*(rows-1)+spaceY/2-1,z]) cube([spaceX*columns,1,4]);
    translate([0,-spaceY/2,z]) cube([spaceX*columns,1,4]);
    translate([-1,-spaceY/2,z]) cube([1,spaceY*rows,4]);
    translate([spaceX*columns,-spaceY/2,z]) cube([1,spaceY*rows,4]);
    
}

module corner() //corner
{
    cube([10,1,40]);
    cube([1,10,40]);
    translate([1,1,4])cube([1,9,1]);
    translate([1,1,4])cube([9,1,1]);
    translate([1,1,35])cube([1,9,1]);
    translate([1,1,35])cube([9,1,1]);
}

module rack(columns, rows, spaceY, spaceX)  //whole rack
{
    //creation of the rack
    if(Upper || Bottom) for(j = [0:1:rows-1]) {
        translate([0,spaceY*j,0]) slot();
    }

    //rails
    if(Upper) rail(36);
    if(Bottom) rail(0);

    //corners
    if(Corner) {
        translate([-2,-spaceY/2-1,0]) corner();
        if(Upper || Bottom) {
            translate([-2,(spaceY*(rows-1)+spaceY/2+1),0]) mirror([0,1,0]) corner();
            translate([spaceX*columns+2,-spaceY/2-1,0]) mirror([1,0,0]) corner();
            translate([spaceX*columns+2,(spaceY*(rows-1)+spaceY/2+1),0]) mirror([1,1,0]) corner();
        }
    }
}

rack(columns, rows, spaceY, spaceX);
