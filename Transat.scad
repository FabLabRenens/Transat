/*
Chaise longue 
- Un cadre externe avec 2 axes et un petit coussin
- Un cadre Interne
- Une toile
*/
Lce=70;    // Longueur cadre externe
lce=37;    // largeur cadre externe
ep=4;      // Epaisseur du bois
lco=6;     // Largeur du coussin
dist=.5;    // distance entre éléments
Lci=50;    // Long interne
lci= lce - 2*ep - 2*dist;
// accrochage toile
y_t=6;     // distance axe crochet toile
x_t=2;   // distance bord crochet toile
oeillet = 2 ; 
picot=1.6;
Pax=50;   // Position axe sur x
daxe=2;   // diamètre axe
alesage=2.5;
ept=.3 ;   // Epaisseur toile

// Cadre externe
module cadre_externe(){
    difference(){
translate([0,-lce/2,0])cube([Lce,lce,ep]);
translate([lco,-lce/2+ep,0])cube([Lce,lce-2*ep,ep]); 
    } 
  // Axes pour cadre interne
  translate([Pax,lce/2-ep,ep/2]) rotate([90,0,0]) cylinder(d=2,h=ep+dist+dist,$fn=48); 
   translate([Pax,-lce/2+ep,ep/2]) rotate([-90,0,0]) cylinder(d=2,h=ep,$fn=48); 
  // Petit coussin
 //   difference(){
translate([lco/2,-lce/2,ep])rotate([-90,0,0])cylinder(d=lco,h=lce,$fn=48);
//translate([0,-lce/2,0])cube([ep,lce,ep/2]); 
 //   } 
}
cadre_externe();
// Cadre interne
module cadre_interne(){
    difference(){
translate([Lce-Lci,-lce/2+ep+dist,0])cube([Lci,lci,ep]);
translate([Lce-Lci,-lce/2+2*ep,0])cube([Lci-ep,lci-2*ep,ep]); 
// Axes pour cadre interne
  translate([Pax,lce/2-ep,ep/2]) rotate([90,0,0]) cylinder(d=alesage,h=lci+1,$fn=64); 
    }
    // picots maintien toile
    color("blue")translate([Lce - ep/1.5 ,-y_t,ep])cylinder(d=picot,h=ep/2,$fn=8);
    color("blue")translate([Lce - ep/1.5 ,y_t,ep])cylinder(d=picot,h=ep/2,$fn=8);
}
cadre_interne();
module toile() {
    difference() {
    translate([0,-lce/2 + 2*ep +dist])cube([Lce - ep -dist,lci-2*dist-2*ep,ept]);
    translate([Lce -ep -dist - x_t,y_t,0])cylinder(d=oeillet,h=2*ept,$fn=8);
    translate([Lce -ep -dist - x_t,-y_t,0])cylinder(d=oeillet,h=2*ept,$fn=8);;    
    }
}
color("red") toile();
/*
projection(cut=true) translate([0,0,-ep/2]) { cadre_interne() ;
    cadre_externe() ;
}
*/