/*


color c1, c2;
int maxFrame = 240;
int minFrame = 48;
int FPS = 24;

//TEST
fadeColor f1;

void setup() {
  
  frameRate(FPS);
  size(1920, 1080);
  background(0);
  
  f1 = new fadeColor();
   
  //ESEMPIO
   delay((minFrame/FPS)*1000);
  
  if (frameCount==maxFrame){
    noLoop();
    }
}

void draw(){
  f1.display(c1,c2);
}


//Oggetto
class fadeColor{
  
  fadeColor(){
    c1 = color(255, 255, 255, 0);
    c2 = color(255, 255, 255, 255);
  }
  
  public void display(color c1, color c2) {
    // Background
    fill(lerpColor(c1, c2, map(frameCount, 0, 240, 0, 1) ));
    rect(0,0, 1920, 1080);
  }
}
*/
