 //Mini computer suport for Ioptron Pier
 
 epsilon=5;
 
 //pier
 dp=144;//pier diameter mm
 hp=250;
 
 //computer support
 lc=110;
 wc=110;
 hc=epsilon+(dp/4);
 rp=10;
 ch=100;
 
 //hole
 ds=4.5;
 spaces=50;
 hs=22;
 
 $fn=100;//resolution

module Make_holes() {
    //color( "blue", 1.0 ){
    translate([spaces,0.5*dp,spaces])rotate([90,0,00])cylinder(h=hs,d=ds,center=true);
    translate([-spaces,0.5*dp,spaces])rotate([90,0,00])cylinder(h=hs,d=ds,center=true);
    translate([spaces,0.5*dp,-spaces])rotate([90,0,00])cylinder(h=hs,d=ds,center=true);
    translate([-spaces,0.5*dp,-spaces])rotate([90,0,00])cylinder(h=hs,d=ds,center=true);
    }//}

difference(){
difference(){
difference(){
difference(){ 
translate([0,hc,0])rotate([90,0,00]) minkowski()
{
  cube([lc,wc,hc],center=true);
  cylinder(h=hc,r=rp,center=true);
}
cylinder(h=hp,d=dp,center=true);
}
rotate([90,0,00]) cylinder(h=hp,d=ch,center=true);
}
{translate([0,0.51*dp,0])rotate([90,0,00])cube([200,15,3],center=true);}
}
Make_holes();
}
 
//QC shapes
//color( "green", 1.0 ) {cylinder(h=hp,d=dp,center=true);}

//color( "red", 1.0 ) {translate([0,0.51*dp,0])rotate([90,0,00])cube([200,15,3],center=true);}

//Make_holes();

