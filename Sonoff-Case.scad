// Simple sonoff Mini case
//

tolerance = 0.25;

thickness = 0.82;

base   = 1.6;

width  = 43.0 + tolerance;
depth  = 20.0 + tolerance;
height = 56.0;

stepWidth  = width - 4.0;
stepDepth  = depth;
stepHeight = 10.0; 

slotWidth  = 12.0;
slotDepth = 4.0;

bumpHeight = 0.2;

holeDia = 5.0;
holeX   = 6.35;
holeY   = 0;
holeZ   = 26.0; //from step

difference() {
    // Outer case
    translate([0,0,height/2]) {
       cube([width + thickness* 2, depth + thickness * 2, height], center = true);
    }
    // Bottom step
    translate([0,0,(stepHeight/2 + base + tolerance /2)]) {
        cube([stepWidth, stepDepth, stepHeight + tolerance], center = true);
    };

    // Inner space
    translate([0,0, (height/2 + stepHeight/2 + base/2 - bumpHeight/2)]) {
        cube([width, depth, (height - stepHeight - base - bumpHeight)], center = true);
    };
    // Top Bump
    translate([0,0, height]) {
        cube([width, 
              depth-bumpHeight*2, 
              bumpHeight*2+tolerance], center = true);
    };
    
    
    // Reset hole
    translate([- width /2 + holeX, depth/2, base + stepHeight + holeZ]) {
        rotate([-90,0,0]) 
            cylinder(h=thickness * 4, d=holeDia, center=true, $fn = 32);
    }
    // Bottom wire slot
    translate([0,0, base/2]) {
        cube([slotWidth, slotDepth, base + tolerance], center = true);
    };
};

