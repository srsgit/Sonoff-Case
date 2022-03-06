// Simple sonoff Mini case
//

tolerance = 0.25;
thickness = 0.82;
base   = 1.6;

// Internal hole size for the Sonoff Mini R2
width  = 43.0 + tolerance;
depth  = 20.0 + tolerance;
// Total height of case
height = 54.5;

// Step at bottom of case to position Sonoff Mini to allow for cable connections
stepWidth  = width - 4.0;
stepDepth  = depth;
stepHeight = 10.0; 

// Centrally located Slot in bottom of case for cable entry
slotWidth  = 12.0;
slotDepth = 4.0;

// Bump/ridge at entry to retain Sonoff Mini 
bumpHeight = 2.0;
bumpWidth  = 0.3;

// Reset/Configure button hole
holeDia = 5.0;
holeX   = 6.35;
holeY   = 0;
holeZ   = 26.0; //from step

// MAIN Body
difference() {

    // Outer case. Position base at Z0
    translate([0,0,height/2]) {
       cube([width + thickness* 2, depth + thickness * 2, height], center = true);
    }
    // Internal step at botton to allow for cable connector
    translate([0,0,(stepHeight/2 + base + tolerance /2)]) {
        cube([stepWidth, stepDepth, stepHeight + tolerance], center = true);
    };

    // Main inner space where Sonoff Mini slides in
    translate([0,0, (height/2 + stepHeight/2 + base/2 - bumpHeight/2)]) {
        #cube([width, depth, (height - stepHeight - base - bumpHeight)], center = true);
    };
    
    // Bump/ridge at entry to retain Sonoff Mini. Only on long edges.
    translate([0,0, height-bumpHeight/2]) {
        cube([width, 
              depth-bumpWidth*2, 
              bumpHeight+tolerance], center = true);
    };
    
    // Reset/Configure button hole
    translate([- width /2 + holeX, depth/2, base + stepHeight + holeZ]) {
        rotate([-90,0,0]) 
            cylinder(h=thickness * 4, d=holeDia, center=true, $fn = 32);
    }

    // Bottom wire slot
    translate([0,0, base/2]) {
        cube([slotWidth, slotDepth, base + tolerance], center = true);
    };
};

