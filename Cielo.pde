/** Classe CieloStellato
  *
  * @author Luciano Mateias
*/

int [] defaultGradientColori3 = new int[]{
  color(0.0, 0.0, 12.0), color(25.0, 22.0, 33.0), color(32.0, 32.0, 44.0), color(58.0, 58.0, 82.0),
  color(81.0, 81.0, 117.0), color(138.0, 118.0, 171.0), color(205.0, 130.0, 160.0), color(234.0, 176.0, 209.0),
  color(235.0, 178.0, 177.0), color(177.0, 181.0, 234.0), color(148.0, 223.0, 255.0), color(103.0, 209.0, 251.0),
  color(56.0, 163.0, 209.0), color(36.0, 111.0, 168.0), color(30.0, 82.0, 142.0), color(36.0, 115.0, 171.0),
  color(30.0, 82.0, 142.0), color(114.0, 138.0, 124.0), color(87.0, 110.0, 113.0), color(22.0, 60.0, 82.0),
  color(7.0, 27.0, 38.0), color(1.0, 10.0, 16.0), color(9.0, 4.0, 1.0), color(21.0, 8.0, 0.0),
};

class Cielo {

  float step;
  
  public Cielo(float step){
    
    this.step = step;

  }
  
  public Cielo(){
    
    this(24);
    
  }
  
  void display(int alpha){
    
    int currentIndex = (frameCount / 24) % 24;
    
    color c1 = defaultGradientColori3[currentIndex] & 0xffffff | (alpha << 24);
    color c2 = defaultGradientColori3[(currentIndex + 1) % 24]  & 0xffffff | (alpha << 24);

    gradiente(0, height, c1, c2);
    
  }
  
  void display(){
    this.display(255);
  }
  
  void gradiente(int y0, int y1, color c1, color c2) {

    push();
  
    strokeWeight(1);
    for (; y0 <= y1; y0++) {
      //stroke(lerpColor(c1, c2, map(y0, 0, y1, 0, map(frameCount % this.step, 0, 23, 0, 1))));
      stroke(lerpColor(c1, c2, map(frameCount % this.step, 0, 23, 0, 1)));
      line(0, y0, width, y0);
    }
  
    pop();
  }
  
}
