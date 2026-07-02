// =========================================================================
// MODULE: FEMALE TAPERED COMPRESSION NUT FOR DRIVE-SHAFT COUPLING
// =========================================================================
$fn = 120; 

// Matching Taper Dimensions
collet_max_od = 16.0;          
collet_min_od = 13.5;          

// Nut Structural Profile
nut_height = 12.0;             // Total thickness of the nut assembly
nut_flat_to_flat = 24.0;       // Standard wrench size flats (6-sided hex)

module compression_nut() {
    difference() {
        // 1. Outer Hexagonal Nut Frame
        cylinder(h = nut_height, d = nut_flat_to_flat / cos(30), center = true, $fn = 6);
        
        // 2. Central Tapered Hole (Forces segments inward)
        // Given a minor 0.2mm tolerance padding for initial assembly thread seating
        translate([0, 0, -nut_height/2 - 0.1])
            cylinder(h = nut_height + 0.2, d1 = collet_max_od + 0.2, d2 = collet_min_od + 0.2, center = false);
            
        // 3. Peripheral Finger Grooves for Tool-less Manual Pre-Tightening
        for (i = [0 : 12]) {
            rotate([0, 0, i * (360 / 12)])
                translate([nut_flat_to_flat/1.1, 0, 0])
                    cylinder(h = nut_height + 2, d = 2.0, center = true);
        }
    }
}

// Render Compression Nut
color("DarkOrange") compression_nut();
