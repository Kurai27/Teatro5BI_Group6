CieloStellato cielo;

void setup() {

  size(1920, 1080);
  frameRate(30);
  
  this.cielo = new CieloStellato(50);
}

void draw() {
  
  fill(52, 28, 144, 45);
  rect(0, 0, width, height);

  pushMatrix();
  
  translate(width/2, height/2);
  this.cielo.display();
  
  popMatrix();
  
  stroke(0);
  fill(52, 28, 144, 255);
  rect(0, height / 2, width, height);
}
