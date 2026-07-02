Here is a comprehensive, production-ready manufacturing specification and assembly guide for your peristaltic pump rotor kit. You can save this text as `FABRICATION.md` in your GitHub repository.

* * * * *

Manufacturing & Assembly Specification: Flanged Peristaltic Rotor Kit
---------------------------------------------------------------------

Project Architecture: The Soft Touch Hemolysis Prevention System\
System Intent: Low-shear, biomimetic fluid circulation utilizing ultra-compliant plant-derived elastomer interfaces and US-sourced precision rotation.

* * * * *

📋 1. Bill of Materials (BOM)
-----------------------------

🧱 Raw Materials & Polymers
---------------------------

| Component | Material | Specification / Grade | Sourcing / Function |
| Roller Wheels (3x) | Natural Rubber Latex (NRL) | Raw botanical sap, customized compounding | Primary interface; compliant occlusion |
| Rotor Hub (1x) | PETG or ABS | Rigid engineering thermoplastic | Structural frame; drive shaft coupling |
| Mold Shell (2-part) | PLA or PETG | Standard rigid 3D filament | Negative casting envelope |

🇺🇸 Precision Mechanical Components
------------------------------------

| Component | Quantity | Manufacturer | Part / Series | Country of Origin |
| Miniature Bearings | 6 (2 per wheel) | New Hampshire Ball Bearings (NHBB) | Precision Miniature / Instrument | USA (Peterborough, NH / Chatsworth, CA) |
| Alternates | 6 | RBC Bearings / Timken | Instrument Series (Specify Berry Compliant) | USA |
| Axle Pins | 3 | Standard Dowel Pin | 3.0mm Ground Stainless Steel (H6 Tolerance) | Domestic Distributor |

* * * * *

🛠️ 2. Equipment & Software Tooling
-----------------------------------

-   CAD Framework: OpenSCAD (Engineered for parametric geometric modifications).
-   3D Slicing/Printing: FDM printer with minimum 0.12mm layer height resolution.
-   Curing Station: Controlled thermal or ambient vulcanization environment for botanical rubber compounding.

* * * * *

📐 3. Geometric Parameters (OpenSCAD Blueprint)
-----------------------------------------------

The following dimensional variables govern the component matrices within the `scad` generation pipeline:

-   Wheel Core OD: `16.0 mm` (Primary tubing compression radius)
-   Flange/Lip OD: `19.0 mm` (Perpendicular wall preventing lateral tube migration)
-   Total Assembly Height: `11.5 mm`
-   Bearing Pocket Envelope: Sized precisely for `6.0 mm` Outer Diameter / `2.5 mm` Depth (Press-fit tolerance).
-   Central Axle Clearance: `3.5 mm`

* * * * *

🏗️ 4. Phase-by-Phase Fabrication Workflow
------------------------------------------

Phase A: Mold Preparation & Slicing
-----------------------------------

1.  Export Stencils: Render the `mold_left` and `mold_right` configurations via OpenSCAD to separate `.stl` matrices.
2.  Print Settings:

    -   Slicer Layer Height: `0.12mm` or lower (minimizes layer lines on the wheel face to prevent fluid pulsation).
    -   Infill: `>= 30%` Grid or Gyroid to prevent wall deformation under clamping pressure.

3.  Surface Post-Processing: Apply a thin micro-layer of high-temperature lacquer or epoxy resin to the inner cavities of the mold. Polish smooth. This ensures a uniform finish on the rubber wheels to eliminate micro-vibrations against the pump tube.

Phase B: Compounding & Latex Casting
------------------------------------

1.  Mold Assembly: Coat the treated internal cavities with a silicone-free mold release agent. Align the two halves using the internal registration keys and clamp them securely.
2.  Material Preparation: Mix the natural rubber latex compound according to your proprietary viscosity formulas. Ensure degassing is performed via a vacuum chamber if necessary.
3.  Pouring & Venting: Inject or pour the liquid latex compound directly into the top pour spout. Tap the mold frame gently to ensure the compound fully occupies the lower and upper flange undercuts.
4.  Curing: Allow the botanical compound to vulcanize according to the specific temperature and humidity requirements dictated by your math formulas.
5.  Shrinkage Calibration: *Note:* If natural evaporation causes more than a 4% dimensional contraction, increase the `bearing_od` parameter within the OpenSCAD script by `0.1mm` iterations until a true snap-fit is achieved.

Phase C: Mechanical Assembly
----------------------------

1.  Bearing Insertion: Clean the molded wheel interfaces. Press-fit two US-made NHBB/RBC miniature bearings into the top and bottom cavities of each natural rubber wheel. The bearings must sit perfectly flush with the flange faces.
2.  Hub Integration: Mount the printed central rotor hub onto the motor drive shaft (e.g., NEMA 17 D-shaft). Secure via the integrated collar.
3.  Axle Pin Press: Align the flanged rubber wheels within the radiating arms of the rotor hub. Insert the `3.0mm` ground stainless steel axle pins through the hub arms and the inner race of the bearings.

* * * * *

🔬 5. Quality Control & Validation Matrix
-----------------------------------------

-   Rotational True-Run: Spin each flanged wheel manually before tube installation. The wheel must rotate freely around the axle pin with zero axial or radial runout.
-   Occlusion Uniformity: Verify that the distance between the wheel "waist" (`16.0mm`) and the outer pump casing track is completely uniform at all 3 points of contact to maintain a stable, non-destructive flow rate.

* * * * *## 🔒 7. Enclosed Sandwich Assembly & Vertical Retention

### Structural Integrity Upgrades
1. **Vertical Constraint**: The `retention_plate()` module caps the entire mechanism. The ground surgical steel axle pins slide smoothly inside horizontal track channels without any risk of vibrating or shifting out of alignment during high-RPM calibration cycles.
2. **Surgical Steel Tolerances**: Ensure your core insert block is machined out of 316VM or 316L medical-grade stainless steel. Standardize the central core mounting set-screws to match your motor shaft orientation profile.
3. **Hardware Assembly**:
   * Drop the compression springs directly into the lower rotor hub chambers.
   * Slide the flanged natural rubber wheels onto the 316 stainless axle pins.
   * Position the axle pins into the linear guide slots under light compression.
   * Overlay the printed or machined retention plate and screw it down firmly into the hub frame using three non-corrosive medical-grade machine screws.
  
## 🔧 8. M3 Assembly & Mechanical Collet Calibration

### Fastener Architecture
1. **Pilot Hole Post-Processing**: The lower rotor chassis prints with `2.5mm` pilot holes. Use a standard M3 x 0.5mm hand tap to cleanly thread the structural arms prior to hardware installation.
2. **Plate Securing**: Use three `M3 x 12mm` stainless steel button-head hex screws to securely sandwich the retention plate to the hub core.

### Compression Collet Operation
1. **Shaft Coupler Principle**: The top plate features an integrated tapered, 4-way split collet tower. 
2. **Locking Nut Installation**: Thread a custom-printed or machined female-tapered M12 nut down over the exterior of the collet tower. As the nut travels downward, it mechanically compresses the 4 individual collet segments inward against the motor shaft.
3. **Dual Stabilization**: This architecture pairs the rigid torque transfer of your inner surgical stainless steel core block with a secondary, zero-backlash concentric grip directly on the motor shaft surface, preventing micro-wobbles during extended pump cycling.

## ⚙️ 9. Cross-Platform Drive Shaft Calibration (Wheaton vs. Watson-Marlow)

### Geometric Adjustments
1. **Bore Dimensioning**: The central channel is standardized to `8.0mm`. This provides smooth slip-clearance for the 0.3125-inch (7.94mm) replacement surgical steel shafts utilized by the Wheaton adjustable chuck connector setup.
2. **Pass-Through Action**: Because the collet sleeve features an open-ended top, long shafts (such as the 36mm Wheaton connector) can pass entirely through the top of the pump assembly without bottoming out.
3. **Short Shaft Clamping**: For Watson-Marlow setups utilizing shorter 15mm to 25mm inputs, the collet sleeve base is positioned low enough on the plate matrix to catch and lock the terminal end of the shaft securely.

### Printing the Compression Nut
* **Layer Resolution**: Print the `compression_nut()` module at `0.10mm` layer heights to maintain tight dimensional tracking along the internal matching taper.
* **Perimeters**: Increase wall perimeters to at least `5` layers to ensure the hex flats do not split when high mechanical force is applied via a wrench during final shaft locking.

### 🔩 Recessed Nut Capture Installation
1. **Hardware Preparation**: Source three standard stainless steel M3 hexagonal nuts. 
2. **Nut Seating**: Flip the printed main chassis upside down. Push the M3 nuts firmly into the 6-sided hex cavities molded into the bottom of each radiating arm.
3. **Seating Method**: If the print tolerances are tight, use a longer M3 screw threaded from the top to smoothly pull the nut up into its recessed pocket until it bottoms out completely. This locks the nut against rotation, allowing easy one-handed fastening from the top retention plate.
