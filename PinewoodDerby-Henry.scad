$fn=100;

// Official Specs
W_in       =1.75;//in
L_in       =7;//in
H_in       =1.25;//in
Daxle_in   =.073;//in
Xaxle1_in  =0.81;//in
Xaxle2_in  =0.81+4.4;//in

in2mm=25.4;

W=W_in*in2mm;
L=L_in*in2mm;
H=H_in*in2mm;
Daxle=Daxle_in*in2mm;
Xaxle1=Xaxle1_in*in2mm;
Xaxle2=Xaxle2_in*in2mm;


difference(){
    base();
    rotate([90,0,180])
        rotate([0,-90,0])
            linear_extrude(W)
                sideProfile();
    rotate([0,0,0])
        rotate([-90,-90,0])
            linear_extrude(L)
                frontProfile();
}

module showFrontProfile(){
translate([0,-20,0])
rotate([-90,-90,0])
    linear_extrude(1)
        frontProfile();
}


module sideProfile(){
    //translate([0,5+15])
    //square([L/2,40]);
}

module frontProfile(){
    difference(){
    translate([H/3,0])
        square([H,W+1]);
    translate([H/3,W/2])
        circle(d=W/2);
    }
}





















module base(){
    difference(){
    cube([W,L,H]);
    translate([0,Xaxle1,Daxle])
        rotate([0,90,0])
            cylinder(W,Daxle,Daxle);
    translate([0,Xaxle2,Daxle]) 
        rotate([0,90,0])   
            cylinder(W,Daxle,Daxle);
    }
}