module ledClip() {
    import("Led_Clip v2.stl");
}

start = true;
end = false;

difference(){
    union() {
        translate([-2.2, 0, 2])
            ledClip();
        translate([19, 0, 0])
            cube([131, 10, 2]);
        if (!end)
        {
            translate([141.5, 0, 2])
                ledClip();
        }
    }
    // chanfer start
    if (start)
    {
        translate([-15, -2.3, -5.5])
            rotate([0,45,0])
                cube(16);
    }
    // chanfer end
    if (end)
    {
        translate([147.5, -2.3, 2.5])
            rotate([0,45,0])
                cube(16);
    }
}