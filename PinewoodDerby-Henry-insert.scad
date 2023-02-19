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



module DefTopProfile(){
        hull(){
translate([0,-Dwheel/2,0])
    circle(d=Dwheel,true);
        translate([0,Dwheel/2,0])
    circle(d=Dwheel,true);
    }
}



module topModule(){

difference(){union(){
    translate([0,5,5])
    cylinder(h=15,d=Dwheel*3/4,center=true);
    translate([0,10,13])
        rotate([0,0,-90])
        scale([12,12,12])
    import("Turret.stl", convexity=20);}

}

}

topModule();
