d = 185;//25.4/4+0.5;
r = d / 2;

bb_d = 25.4/4+1.0;
bb_r = bb_d / 2;

//color("red") translate([-102.5,-5,10]) cube([205,10,10]);

// Legs
for(i = [0 : 90 : 360]) {
        rotate([0,0,i-15]) translate([0,0,-34.9]) difference() {
            rotate_extrude(angle=30, $fn=180) {translate([97,0,0]) square([5,35]);};
            translate([0,0,-1]) rotate([0,0,10]) rotate_extrude(angle=10, $fn=180) {translate([96,0,0]) square([7,16]);};
    };
};

// Support for center
union() {
    translate([-8,-100,-35]) cube([15,205,14.5]);
    translate([-2.5,-19,-25]) rotate([30,0,0]) cube([4,9,9]);
    translate([-2.5,11,-22]) rotate([-30,0,0]) cube([4,9,9]);
};


// Outer
translate([0,0,5]) difference() {
    cylinder(r=r+10, h=10,center=true, $fn=360);
    cylinder(r=r+4, h=11, center=true, $fn=360);
    rotate_extrude($fn=360) {
        translate([r+2,0,0]) circle(bb_r, $fn=36);
    };
}

// Inner
translate([0,0,5]) difference() {
    cylinder(r=r, h=10,center=true, $fn=360);
    cylinder(r=r-5, h=11, center=true, $fn=360);
    rotate_extrude($fn=360) {
        translate([r+2,0,0]) circle(bb_r, $fn=36);
    };
}



difference() {
    linear_extrude(height=10) {
        import("gear_67-rotor.dxf");
    };
    difference() {
        translate([0,0,-0.5]) cylinder(r=205/2, h=11);
        translate([0,0,-1.0]) cylinder(r=185/2, h=10, $fn=36);
    };
    translate([0,0,5]) rotate_extrude($fn=360) {
        translate([r+2,0,0]) circle(bb_r, $fn=36);
    };
};


    

translate([2,0,0]) linear_extrude(height=7) {
    import("gear_13-large-motor.dxf");
};

// Fan
difference() {union() {
        linear_extrude(height=9) {
            import("gear_37-fan-22.2-hole.dxf");
        };
        translate([0,0,8.9]) 
            linear_extrude(height=30, twist=-45, scale=0.5, slices=20) union() {
                circle(r=20);
                square([5,89], center=true);
                rotate(45) square([5,89], center=true);
                rotate(90) square([5,89], center=true);
                rotate(135) square([5,89], center=true);
            };
    };
    translate([0,0,8.9]) cylinder(30.2,22.2/2,5);
};

// Printer limit
//color("red") translate([0,0,-2.5]) cube([205,5,5], center=true);


// Base
union() {
    translate([0,0,-3]) cylinder(r=7.7/2, h=11, $fn=360);
    translate([0,0,-3]) cylinder(r=9/2, h=4, $fn=360);
    difference() {
        hull() {
            translate([0,0,-20]) cylinder(r=15, h=17.1);
            translate([65.65-21/2,0,-7.5-5]) cube([1,25.5,15], center=true);
        };
        translate([-2.5,-19,-25]) rotate([30,0,0]) cube([5,10,10]);
        translate([-2.5,11,-22]) rotate([-30,0,0]) cube([5,10,10]);
    };
    // Motor housing
    translate([65.65,0,-7.5-5]) difference() {
        cube([21,25.5,15], center=true);
        cube([16,20.5,40], center=true);
    };
};






//Center of motor shaft
//color("green") translate([65.65,0,0]) cylinder(r=0.5, h=30);
