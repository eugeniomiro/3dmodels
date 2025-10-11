module extrusion_lock(len = 40) {
    rotate([270, 270, 90])
        linear_extrude(len) {
            polygon([
                [ 0,          0],
                [ 0,          8],
                [ 0.78,       8],
                [ 0.78 + 2.5, 8],
                [ 0.78 + 5,   8 + 2.5],
                [ 0.78 + 7,   8 + 2.5],
                [ 0.78 + 7,   8 - 4.5], // CURVA ACÁ
                [ 0.78 + 2.5, 8 - 4.5],
                [ 0.78      , 8 - 4.5],
                [ 0.78      , 0]
            ]);   
        }
    }
    
 extrusion_lock();