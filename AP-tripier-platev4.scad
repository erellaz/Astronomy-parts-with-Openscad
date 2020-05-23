//Adapt AP 900 or 110 GTO to Ioptron Tri Pier
//Flat surface to: 119FSA
//T6061 1/2" thick aluminium.

tomm=25.4;    // Inch to mm if necessary, use if sizing in mm, 25.4 if sizing in inches

//Dimensions-------------------------------------------------
//Plate
hp=.5*tomm;   //height
rp=.5*tomm;   //rounding corner
wp=8.5*tomm-rp;//width
lp=8.5*tomm-rp;//length


// AP adapter called 119FSA, we need 1/4-20 taped holes on 3.615” radius
// for 1/4-20 tap, the drilled hole should be .201 = 13/64 = #7
dhole_119_FSA=.201*tomm; 
tr=3.615*tomm; 

//Ioptron flat surface, using through holes for M8-125 screws on 60 and 65 radius, need through holes
dhole_tp=8.2;
dhole_tp2=14;
tr_tp1=60;
tr_tp2=65;
center_hole_tp=15;
//--------------------------------------------------------------


$fn=100;//resolution

//Make plate
module Make_Plate(lp=lp,wp=wp,hp=hp,rp=rp) {
minkowski()
{
  cube([lp,wp,hp],center=true);
  cylinder(h=hp,r=rp,center=true);
}}

//Minkowski does not export to SEP correctly, so here is a work around
module Make_Platev2(lp=lp,wp=wp,hp=hp,rp=rp) {
union()
{
  cube([lp,wp+rp*2,hp],center=true);
  cube([lp+rp*2,wp,hp],center=true);  
  translate([lp/2,wp/2,0]) cylinder(h=hp,r=rp,center=true);
  translate([lp/2,-wp/2,0]) cylinder(h=hp,r=rp,center=true);
  translate([-lp/2,wp/2,0]) cylinder(h=hp,r=rp,center=true);
  translate([-lp/2,-wp/2,0]) cylinder(h=hp,r=rp,center=true); 
   
}}


//Make 119FSA holes for the AP adapter
module Make_AP_holes(hp=hp,dhole_119_FSA=dhole_119_FSA, tr=tr) {
rotate([0,0,15])translate([tr,0,0]) cylinder(h=3*hp,d=dhole_119_FSA,center=true);
rotate([0,0,45])translate([tr,0,0]) cylinder(h=3*hp,d=dhole_119_FSA,center=true);
rotate([0,0,315])translate([tr,0,0]) cylinder(h=3*hp,d=dhole_119_FSA,center=true);
rotate([0,0,345])translate([tr,0,0]) cylinder(h=3*hp,d=dhole_119_FSA,center=true);
rotate([0,0,225])translate([tr,0,0]) cylinder(h=3*hp,d=dhole_119_FSA,center=true);
rotate([0,0,195])translate([tr,0,0]) cylinder(h=3*hp,d=dhole_119_FSA,center=true);
rotate([0,0,165])translate([tr,0,0]) cylinder(h=3*hp,d=dhole_119_FSA,center=true);
rotate([0,0,135])translate([tr,0,0]) cylinder(h=3*hp,d=dhole_119_FSA,center=true);
}

// Make Ioptron 
module Make_IO_holes(hp=hp,dhole_tp=dhole_tp,dhole_tp2=dhole_tp2,tr_tp1=tr_tp1,tr_tp2=tr_tp2) {
cylinder(h=3*hp,d=center_hole_tp,center=true);
rotate([0,0,0])translate([tr_tp1,0,0]) union() {cylinder(h=3*hp,d=dhole_tp,center=true); cylinder(h=20,d=dhole_tp2,center=false);};
rotate([0,0,90])translate([tr_tp2,0,0]) union(){cylinder(h=3*hp,d=dhole_tp,center=true); cylinder(h=20,d=dhole_tp2,center=false);};
rotate([0,0,180])translate([tr_tp1,0,0]) union(){cylinder(h=3*hp,d=dhole_tp,center=true);cylinder(h=20,d=dhole_tp2,center=false);};
rotate([0,0,270])translate([tr_tp2,0,0]) union(){cylinder(h=3*hp,d=dhole_tp,center=true);cylinder(h=20,d=dhole_tp2,center=false);};
}

//Build adapter--------------------------------------
module Make_all(){
difference(){
Make_Platev2(lp=lp,wp=wp,hp=hp,rp=rp);
union(){
Make_AP_holes(hp=hp,dhole_119_FSA=dhole_119_FSA);
Make_IO_holes(hp=hp,dhole_tp=dhole_tp,dhole_tp2=dhole_tp2,tr_tp1=tr_tp1,tr_tp2=tr_tp2);
}
}
}

Make_all();

//--------------------------------------------------
//some QCs
//3D print this ring to QC you hole position versus the actual pier
//intersection(){
//    cylinder(h=3*hp,r=80,center=true);
//difference(){
//    Make_all();  
//    cylinder(h=3*hp,r=50,center=true);
//}
//}

//QC shapes
//color( "green", 1.0 ) {cylinder(h=1.5*hp,r=(3.615-0.1005)*25.4,center=true);}
//color( "green", 1.0 ) {cube([60*2,65*2,3*hp],center=true);}
//color( "red", 1.0 ) {translate([4.6*tomm,0,0]) cube(size = [1*tomm, 1*tomm, 1*tomm], center = false);}