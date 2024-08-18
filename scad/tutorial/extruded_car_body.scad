$fa=1;
$fs=0.4;

module extruded_car_body(length=80, rear_height=20, rear_width=25, scaling_factor=0.5, rounded = false) {
    rotate([0,-90,0])
    linear_extrude(height=length, center=true, scale=scaling_factor) {
        resize([rear_height, rear_width])
            circle(d=rear_height);
    }
    if (rounded) {
        translate([length/2,0,0])
            resize([rear_height, rear_width, rear_height])
            sphere(d=rear_height);
        translate([-length/2,0,0])
            scale(scaling_factor)
            resize([rear_height, rear_width, rear_height])
            sphere(d=rear_height);
    }
}

extruded_car_body(rounded=true);