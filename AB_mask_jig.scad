//openscad code for 3d printed pattern jig based on Randy's design
//scaled 110% from original PDF so that square is 1x1 inch
$fn=100;

//note: it doesn't fit on a printer bed. The entire thing is "wholepattern" and then it gets sawed in half by the difference command at the end and you can print either half. Fold fabric in half.

module wholepattern(){
module outline(){
scale(0.6887)
    //no idea why this is required but openscad dimensions are accurate in cm and the import was this much too big out of illustrator.
linear_extrude(height = 4.61, center = true)//height is scaled so it ends up being 1/8"=3.175 mm
import(file="C:/Users/redhe/Desktop/AB_v3_shape.svg", center=true);}

//cutout will be an oval in this version
module cutout(){
    hull(){
    translate([20,-62.5,0])
    cylinder(h=50,r=50,center=true);
        translate([-10,-62.5,0])
    cylinder(h=50,r=50,center=true);}}

module cutout2(){
    scale(0.64)//About 90% of the screwy "0.6887" factor
    translate([1.5,-5,4])
    {linear_extrude(height = 8, center = true)
import(file="C:/Users/redhe/Desktop/AB_v3_shape.svg", center=true);}}

difference(){
difference(){
    outline();
    cutout2();}
    cutout();};


cube([167,10,3.175], center=true);
//bars across the design, taken out for this version
//    rotate([0,0,30])
//    cube([10,280,3.175],center=true);
//        rotate([0,0,-30])
//    cube([10,280,3.175],center=true);
//translate([0,0,5.9125])
//cylinder(h=15,r=15, center=true);
    };

module leftside(){
    union(){
difference(){
wholepattern();
    translate([0,75,0])
    cube([170,150, 50], center=true);};};}
leftside();

module rightside(){
difference(){
wholepattern();
    translate([0,-75,0])
    cube([170,150, 50], center=true);};}
//rightside();
    
