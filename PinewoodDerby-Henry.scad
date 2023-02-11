$fn=100;

// Official Specs
W_in       =1.75;//in
L_in       =7;//in
H_in       =1.25;//in
Daxle_in   =.073;//in
Dwheel_in  =1.190;//in
Wwheel_in  =0.415;//in
Xaxle1_in  =0.81;//in
Xaxle2_in  =(0.81+4.4);//in


in2mm=25.4;

W=W_in*in2mm;
L=L_in*in2mm;
H=H_in*in2mm;
Daxle=Daxle_in*in2mm;
Xaxle1=Xaxle1_in*in2mm;
Xaxle2=Xaxle2_in*in2mm;
Dwheel=Dwheel_in*in2mm;
Wwheel=Wwheel_in*in2mm;
D_hole_weights=7;
X_weights=100.9; // from Calcs

Hbase=15;

module wheels(){
    translate([-Wwheel-1,Xaxle1,2])
        rotate([0,90,0])
            color("black")cylinder(d=Dwheel,h=Wwheel);
    
    translate([W+1,Xaxle1,2])
        rotate([0,90,0])
            color("black")cylinder(d=Dwheel,h=Wwheel);
    
    translate([-Wwheel-1,Xaxle2,2])
        rotate([0,90,0])
            color("black")cylinder(d=Dwheel,h=Wwheel);
    
    translate([W+1,Xaxle2,2])
        rotate([0,90,0])
            color("black")cylinder(d=Dwheel,h=Wwheel);
    
}

module DefsideProfile(){

difference(){
    polygon(points=[
    [0,H],
    [L+.1,H],
    [L+.1,Hbase],
    [0,Hbase],
    
    ]);

//translate([Xaxle1,2,0])
//    circle(d=Dwheel);
//        translate([Xaxle2,2,0])
//    circle(d=Dwheel);
}

}

module DeffrontProfile(){

    
}

module DefTopProfile(){
        hull(){
translate([L/2-Dwheel/2,W/2,0])
    circle(d=Dwheel);
        translate([L/2+Dwheel/2,W/2,0])
    circle(d=Dwheel);
    }
}






module base(){
    difference(){
    cube([W,L,H]);
    translate([0,Xaxle1,Daxle+1])
        rotate([0,90,0])
            cylinder(W,Daxle/2,Daxle/2);
    translate([0,Xaxle2,Daxle+1]) 
        rotate([0,90,0])   
            cylinder(W,Daxle/2,Daxle/2);
    
    translate([W/2,X_weights,10]) 
        rotate([0,0,0])   
            cylinder(H,D_hole_weights,D_hole_weights);
    }
    
}


module topProfile(){
    translate([W,0,0])
        rotate([0,0,90])
                linear_extrude(W+.2)
                    DefTopProfile();
}

module sideProfile(){
    rotate([90,0,180])
        rotate([0,-90,0])
            translate([0,0,-.1])
                linear_extrude(W+.2)
                    DefsideProfile();
}
module frontProfile(){
    rotate([-90,-90,0])
    translate([0,0,-.1])
    linear_extrude(L+.2)
    translate([0,-0.01,0])
    scale([1,1.01,1])
        DeffrontProfile();
}

module showSideProfile(){
rotate([0,0,90])
        DefsideProfile();
}

module showFrontProfile(){
rotate([0,0,-90])
        DeffrontProfile();
}

module showTopProfile(){
translate([W*2+10,0,0])
rotate([0,0,90])
        DefTopProfile();
}


//difference(){
//    base();
//    sideProfile();
//    frontProfile();
//    topProfile();
//}

//wheels();
showFrontProfile();
showSideProfile();
showTopProfile();