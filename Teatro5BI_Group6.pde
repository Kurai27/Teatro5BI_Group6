CieloStellato cieloGrande;
CieloStellato cieloPiccolo;
Sole solePolare; 

color[] coloreStelle = new color[] {
   color(157, 180, 255), color(167, 188, 255), color(175, 195, 255),
   color(192, 209, 255), color(228, 232, 255), color(251, 248, 255),
   color(255, 245, 236), color(255, 241,223), color(255, 215, 174),
   color(255, 190, 127), color(255, 187, 123)
  };

int i;

public color randomColoreStella() {
  return this.coloreStelle[int(random(this.coloreStelle.length))];
}
 

void setup() {

  size(1920, 1080);
  frameRate(30);
  
  this.cieloGrande = new CieloStellato(1000, coloreStelle, 0, 3, 0, 2 * PI);
  this.cieloPiccolo = new CieloStellato(500, coloreStelle, 0, 1, 0, 2 * PI);
  
  this.solePolare = new Sole(0, 0, 0, 3, 200, 100, randomColoreStella(), randomColoreStella());
  
  i = 200;
}

void draw() {
  
  fill(52, 28, 144, i);//(height / 2) * sin(i) * 255);
  rect(0, 0, width, height);

  pushMatrix();
  
  translate(width/2, height/4 - 100);
  this.cieloGrande.display(0.002, 1);
  this.cieloPiccolo.display(0.0001, 1);
  
  this.solePolare.display();
  
  popMatrix();
  
  stroke(0);
  fill(52, 28, 144, 255);
  rect(0, height / 2, width, height);

  i = (i / 2) + 1;

}
