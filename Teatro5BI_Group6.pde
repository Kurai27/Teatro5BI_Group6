CieloStellato cieloGrande;
CieloStellato cieloPiccolo;
PuntoLuminoso stellaPolare; 

int i;

Cielo cielo;

void setup() {

  size(1920, 1080);
  frameRate(24);

  cielo = new Cielo();

  this.cieloGrande = new CieloStellato(750, 0, 3, 0, 2 * PI);
  this.cieloPiccolo = new CieloStellato(500, 0, 1, 0, 2 * PI);

  this.cieloGrande.setSpeed(0.002);
  this.cieloPiccolo.setSpeed(0.001);

  this.stellaPolare = new PuntoLuminoso(
    0, 0, 0, 3, 200, 100, 
    cieloGrande.randomColoreStella(), 
    cieloGrande.randomColoreStella()
    );

  i = 200;
}

void draw() {

  cielo.display(i);

  pushMatrix();

  translate(width/2, height/4 - 100);
  this.cieloGrande.display();
  this.cieloPiccolo.display();

  this.stellaPolare.display();

  popMatrix();

  stroke(0);
  fill(52, 28, 144, 255);
  rect(0, height / 2, width, height);

  i = int((i / 2) + 1);
}
