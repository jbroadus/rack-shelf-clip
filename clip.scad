// This clip, meant to be used in pairs, was designed to hold small items in place on a vented rack shelf.

// Depth in the Z direction (height on the print bed)
depth=10;
// Distance between the outer edges of the base clips.
width = 10;
// Thickness of the horizontal plate.
floor_thickness = 2;
// Thickness of the bottom clip legs.
base_thickness = 1;
// Height of the bottom clips.
base_height=3;
// Thickness of the top clip leg.
top_thickness = 3;
// Height of the top clip.
top_height=19;
// Offset of the top clip on the base plate. At 0, the back of the clip is at the center of the clip.
top_offset = -1;

module clip(height, thickness) {
    translate([thickness/2,height/2,0]) union() {
        cube([thickness,height,depth], true);
        latch_side = sqrt(2 * thickness * thickness);
        translate([thickness/2,height/2-thickness,0]) rotate([0,0,45]) cube([latch_side,latch_side,depth], true);
    }
}

module top() {
    union() {
        translate([0,floor_thickness/2,0]) 
        cube([width,floor_thickness,depth], true);
        translate([top_offset,0,0]) 
        clip(top_height, top_thickness);
    }
}

translate([0,0,depth/2])
union() {
    translate([-width/2,0,0]) clip(base_height, base_thickness);
    translate([width/2,0,0]) rotate([0,180,0]) clip(base_height, base_thickness);
    rotate([180,0,0]) top();
}
