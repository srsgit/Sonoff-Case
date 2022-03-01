// Simple sonoff Mini case
//

tolerance = 0.25;

thickness = 0.82;
width  = 43.0 + tolerance;
depth  = 20.0 + tolerance;
height = 60.0;

holeDia = 5.0;
holeX   = 6.35;
holeY   = 0;
holeZ   = 16.5;

difference() {
    cube([width + thickness* 2, depth + thickness * 2, height], center = true);
    translate([0,0,thickness]) {
        cube([width, depth, height], center = true);
    };
    translate([width /2 - holeX, depth/2, -height/2 + thickness + holeZ]) {
        rotate([-90,0,0]) 
            cylinder(h=thickness * 4, d=holeDia, center=true, $fn = 32);
    }
};

