$fa=1;
$fs=0.4;

module spoked_wheel(radius = 12, width = 5, thickness = 5, number_of_spokes = 7, spoke_radius = 1.5) {
    inner_radius = radius - thickness / 2;
    rotate([90, 0, 0]){
        difference() {
            cylinder(width, radius, radius, center=true);
            cylinder(width + 1, inner_radius, inner_radius, center=true);
        }
        step = 360 / number_of_spokes;
        echo(step);
        for(i = [0: step: 359]) {
            angle = i;
            rotate([0, 90, angle])
                cylinder(inner_radius, spoke_radius, spoke_radius);
        }
    }
}

spoked_wheel();