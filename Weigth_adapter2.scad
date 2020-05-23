$fn=50;
//color("red") cylinder(h=100,d=28, center=true);
//translate([0,0,10]) cylinder(h=10,r=10, center=true);

difference(){
union(){
translate([0,0,35])cylinder(h=3,d=50, center=true);
cylinder(h=70,d=32, center=true);
}
union(){
translate([3.0/2,0,0])cylinder(h=100,d=28.5, center=true);
translate([20,0,0])cube([20,10,100], center=true);
}
}