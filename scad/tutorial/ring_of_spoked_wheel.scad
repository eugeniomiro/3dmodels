$fa=1;
$fs=0.4;

module spoked_wheel(radius = 12, width = 5, thickness = 5, number_of_spokes = 7, spoke_radius = 1.5) {
    inner_radius = radius - thickness / 2;
    difference() {
        cylinder(width, radius, radius, center=true);
        cylinder(width + 1, inner_radius, inner_radius, center=true);
    }
}

spoked_wheel();