// =========================================================================
// MODULE: VERTICAL SPLIT CASTING MOLD FOR FLANGED LATEX WHEELS
// =========================================================================
$fn = 120; // High resolution for smooth surface boundaries

// Inner Wheel Dimensions (The "Waist" touching the tube)
wheel_inner_od = 16.0;   // Diameter where tube touches
wheel_width = 11.5;      // Total width of the wheel

// Flange / Lip Settings (The "Walls" to hold the tube)
flange_od = 19.0;        // Outer diameter of the lip (must be > wheel_inner_od)
flange_width = 1.5;      // Thickness of the side walls

// Bearing & Axle Settings (Sized for a press-fit)
bearing_od = 6.0;        // Example: MR63 or R188 outer diameter
bearing_depth = 2.5;     // Depth to sink bearing
center_pin_d = 3.5;      // Axle clearance hole

// Mold Block Settings
mold_block_size = 28.0;  // Size of the mold cube
key_size = 4.0;          // Alignment keys

// --- VIEW SELECTION ---
// Change to: "assembly", "mold_left", "mold_right", or "wheel_check"
view_mode = "assembly"; 

module wheel_positive() {
    difference() {
        union() {
            // 1. The main "Waist" cylinder (tube contact area)
            cylinder(h = wheel_width - 0.1, d = wheel_inner_od, center = true);
            
            // 2. The Top Flange
            translate([0, 0, (wheel_width/2) - (flange_width/2)])
                cylinder(h = flange_width, d = flange_od, center = true);
            
            // 3. The Bottom Flange
            translate([0, 0, -((wheel_width/2) - (flange_width/2))])
                cylinder(h = flange_width, d = flange_od, center = true);
        }
        
        // Axle Hole
        cylinder(h = wheel_width + 2, d = center_pin_d, center = true);
        
        // Bearing Pocket (Top)
        translate([0, 0, (wheel_width/2) - (bearing_depth/2) + 0.01])
            cylinder(h = bearing_depth + 0.02, d = bearing_od, center = true);
            
        // Bearing Pocket (Bottom)
        translate([0, 0, -((wheel_width/2) - (bearing_depth/2) + 0.01)])
            cylinder(h = bearing_depth + 0.02, d = bearing_od, center = true);
    }
}

module split_mold(side = "left") {
    difference() {
        // The Base Block
        translate([-mold_block_size/2, (side == "left" ? -mold_block_size : 0), -mold_block_size/2])
            cube([mold_block_size, mold_block_size, mold_block_size]);

        // Subtract the Wheel (The Cavity)
        wheel_positive();
        
        // Pour Spout / Vent (Top of mold)
        translate([0, 0, (wheel_width/2) + 2])
            cylinder(h = 20, d1 = 3, d2 = 8, center = false);
            
        // Alignment Keys (Left side gets alignment dimples)
        if (side == "left") {
            translate([mold_block_size/3, 0, mold_block_size/3]) sphere(d=key_size);
            translate([-mold_block_size/3, 0, -mold_block_size/3]) sphere(d=key_size);
        }
    }
    
    // Add Male Keys to Right Side
    if (side == "right") {
        translate([mold_block_size/3, 0, mold_block_size/3]) sphere(d=key_size*0.95); 
        translate([-mold_block_size/3, 0, -mold_block_size/3]) sphere(d=key_size*0.95);
    }
}

// --- RENDERING LOGIC ---
if (view_mode == "assembly") {
    translate([0, -5, 0]) color("SkyBlue") split_mold("left");
    translate([0, 5, 0]) color("Pink") split_mold("right");
    %wheel_positive(); // Show the ghosted destination wheel inside cavity
} else if (view_mode == "mold_left") {
    rotate([90, 0, 0]) split_mold("left"); 
} else if (view_mode == "mold_right") {
    rotate([-90, 0, 0]) split_mold("right"); 
} else if (view_mode == "wheel_check") {
    wheel_positive();
}
