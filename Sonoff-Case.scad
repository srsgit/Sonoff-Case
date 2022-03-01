// Simple sonoff Mini case
//

tolerance = 0.25;

thickness = 0.82;
width  = 43.0 + tolerance;
depth  = 20.0 + tolerance;
height = 60.0;

stepWidth  = width - 4.0;
stepDepth  = depth;
stepHeight = 10.0;

slotWidth  = 28.0;
slotHeight = 5.0;

holeDia = 5.0;
holeX   = 6.35;
holeY   = 0;
holeZ   = 26.0;

difference() {
    // Outer case
    cube([width + thickness* 2, depth + thickness * 2, height], center = true);

    // Bottom step
    translate([0,0,thickness]) {
        cube([stepWidth, stepDepth, height], center = true);
    };

    // Inner space
    translate([0,0,thickness + stepHeight]) {
        cube([width, depth, height], center = true);
    };
    // Reset hole
    translate([- width /2 + holeX, depth/2, -height/2 + thickness + holeZ + stepHeight]) {
        rotate([-90,0,0]) 
            cylinder(h=thickness * 4, d=holeDia, center=true, $fn = 32);
    }
    // Botton wire slot
    translate([0,0,-thickness]) {
        cube([slotWidth, slotHeight, height], center = true);
    };
};

