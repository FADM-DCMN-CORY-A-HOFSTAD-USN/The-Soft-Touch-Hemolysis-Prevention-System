// =========================================================================
// MODULE: FILAMENT SHRINKAGE & HARDWARE TOLERANCE TEST COUPON
// =========================================================================
$fn = 100;

// Target Dimensions (Exactly matching your File 2 Rotor parameters)
target_outer_width = 20.0;    // Standard reference block for caliper check
target_height = 8.0;          // Total height of the test strip

// Target Hardware Fits
m3_nut_flat_to_flat = 5.5;    // Target M3 hex nut width
m3_clearance_d = 3.4;        // Target smooth bolt hole pass-through
axle_pin_d = 3.0;             // Target vertical slot thickness

// --- TEST BLOCK DESIGN ---
module shrinkage_coupon() {
    difference() {
        // Base block matrix
        cube([target_outer_width * 2, target_outer_width, target_height], center = true);
        
        // Test Fit 1: Vertical Axle Pin Guide Track (Linear Slot)
        translate([-target_outer_width / 2, 0, 0])
            hull() {
                translate([-2, 0, 0]) cylinder(h = target_height + 2, d = axle_pin_d, center = true);
                translate([2, 0, 0]) cylinder(h = target_height + 2, d = axle_pin_d, center = true);
            }
            
        // Test Fit 2: Vertical M3 Screw Pass-Through Hole
        translate([target_outer_width / 2, 0, 0])
            cylinder(h = target_height + 2, d = m3_clearance_d, center = true);
            
        // Test Fit 3: Recessed Hex Nut Pocket (Underneath side)
        // Calculated using the exact internal mathematics from File 2
        translate([target_outer_width / 2, 0, -target_height / 4])
            cylinder(h = target_height / 2 + 0.1, d = m3_nut_flat_to_flat / cos(30), center = true, $fn = 6);
    }
}

// Render the test coupon flat on the build plate
shrinkage_coupon();
