// =========================================================================
// MODULE: TOP RETENTION PLATE WITH INTEGRATED UNIVERSAL SHAFT EXPANSION COLLET
// =========================================================================
$fn = 120; 

motor_shaft_bore = 8.0;        // Clearance for up to 7.94mm (0.3125") surgical steel shafts
rotor_radius = 26.0;
axle_pin_d = 3.0;
slot_length = 4.0;
m3_clearance_d = 3.2;

// Collet External Taper (Matches the compression nut internal profile)
collet_height = 10.0;          
collet_max_od = 16.0;          // Outer diameter at taper base
collet_min_od = 13.5;          // Outer diameter at taper top
collet_slots = 4;              
collet_slot_w = 1.2;           

module collet_retention_plate() {
    plate_thickness = 3.0;
    
    difference() {
        union() {
            // Main Flat Matrix Plate
            cylinder(h = plate_thickness, d = (rotor_radius + 8) * 2, center = true);
            
            // Rising Clamping Collet Sleeve (Tapered Cone)
            translate([0, 0, plate_thickness/2])
                cylinder(h = collet_height, d1 = collet_max_od, d2 = collet_min_od, center = false);
        }
        
        // Continuous central drive shaft bore passing completely through
        translate([0, 0, -5])
            cylinder(h = collet_height + plate_thickness + 10, d = motor_shaft_bore, center = false);
        
        // Radial clear slots matching the underlying pin travel track
        for (i = [0 : 2]) {
            rotate([0, 0, i * (360 / 3)]) {
                // Precision slot for moving axle pin
                translate([rotor_radius - (slot_length/2), 0, 0])
                    hull() {
                        translate([-slot_length/2, 0, 0]) cylinder(h = 20, d = axle_pin_d + 0.2, center = true);
                        translate([slot_length/2, 0, 0]) cylinder(h = 20, d = axle_pin_d + 0.2, center = true);
                    }
                // M3 Smooth Clearance Screwholes
                translate([rotor_radius - slot_length - (8.0) - 3, 0, 0])
                    cylinder(h = 20, d = m3_clearance_d, center = true);
            }
        }
        
        // Cutting the Compression Relief Slits into the Collet Sleeve
        for (j = [0 : collet_slots - 1]) {
            rotate([0, 0, j * (360 / collet_slots)])
                translate([0, 0, plate_thickness])
                    cube([collet_max_od + 2, collet_slot_w, collet_height + 2], center = false);
        }
    }
}

// Render Retention Plate
color("LightSteelBlue") collet_retention_plate();
