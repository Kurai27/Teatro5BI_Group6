Montagna m1, m2, m3, m4, m11, m22,m33, m44;
Montagna[][] montagne;
CieloStellato cieloGrande;
PuntoLuminoso s;

float t, y, rectHeight;
int alpha = 0, posx = 0, posy = 0;
int scene1 = 240*2, scene2 = 480*2;//, scene3 = 1440/100, scene4 = 4320/100;
PGraphics pg;

public void settings() {
  size(1920, 1080, P2D);
}

void setup() {
  frameRate(24);
  
  montagne = new Montagna[4][2];
  
  montagne[0][0] = new Montagna(0, 898, width/2, height, 1.4, 9, 40, color(#000000));
  montagne[0][1] = new Montagna(width/2, height, width, 898, 1.4, 9, 40, color(#000000));
  montagne[1][0] = new Montagna(0, 1007, width/2, 791, 1.2, 9, 60, color(#000000));
  montagne[1][1] = new Montagna(width/2, 791, width, 1007, 1.2, 9, 60, color(#000000));
  montagne[2][0] = new Montagna(0, 820, width/2, 647, 1, 6, 80, color(#000000));
  montagne[2][1] = new Montagna(width/2, 647, width, 820, 1, 6, 80, color(#000000));
  montagne[3][0] = new Montagna(0, 539, width/2, 474, 1, 6, 120, color(#000000));
  montagne[3][1] = new Montagna(width/2, 474, width, 539, 1, 6, 120, color(#000000));
  
  s = new PuntoLuminoso(width/2, height, 50.0, 900.0, 200, 0, color(252, 183, 74), color(255, 132, 0));
  cieloGrande = new CieloStellato(750, 0, 3, 0, 2 * PI);
  cieloGrande.setSpeed(0.002);
  
  pg = createGraphics(1920, 1080, P3D);
  pg.smooth(8);
  

}

void draw() {
  if (frameCount <= scene1) {
    background(lerpColor(color(252, 183, 74), color(38, 42, 90), map(frameCount, 0, scene1, 0.7, 1)));
    s.display();    
    t = map(frameCount, 0, scene1, 1, 0);
    y = 1-pow(t, 2.6);
        

    montagne[0][0].setColour(lerpColor(color(242, 176, 102), color(255, 132, 0), map(frameCount, 0, scene1, 0.5, 0.3)));
    montagne[0][1].setColour(lerpColor(color(242, 176, 102), color(255, 132, 0), map(frameCount, 0, scene1, 0.5, 0.3)));
    montagne[1][0].setColour(lerpColor(color(177, 91, 58), color(255, 132, 0), map(frameCount, 0, scene1, 0.5, 0.3)));
    montagne[1][1].setColour(lerpColor(color(177, 91, 58), color(255, 132, 0), map(frameCount, 0, scene1, 0.5, 0.3)));
    montagne[2][0].setColour(lerpColor(color(110, 44, 28), color(255, 132, 0), map(frameCount, 0, scene1, 0.5, 0.3)));
    montagne[2][1].setColour(lerpColor(color(110, 44, 28), color(255, 132, 0), map(frameCount, 0, scene1, 0.5, 0.3)));
    montagne[3][0].setColour(lerpColor(color(50, 19, 25), color(255, 132, 0), map(frameCount, 0, scene1, 0.5, 0.3)));
    montagne[3][1].setColour(lerpColor(color(50, 19, 25), color(255, 132, 0), map(frameCount, 0, scene1, 0.5, 0.3)));


    for (Montagna[] m : montagne) {
      m[0].scaleY(y);
      m[1].scaleY(y);
    }
    
    for (int i = 3; i >= 0; i--) {
      montagne[i][0].display();
      montagne[i][1].display();
    }

    rectHeight = map(y, 0, 1, -height, 0);
    s.setY(montagne[3][0].getLastY());
    
    fill(0, 0, 0);
    rect(0, height, width, rectHeight);
    noFill();
  } 

  if ( frameCount > scene1 && frameCount <= scene2) {

    
  background(color(38, 42, 90));
  s.display();
  s.setR1(map(frameCount, scene1, scene2, 50, 0));
  s.setR2(map(frameCount, scene1, scene2, 900, 0));
  s.setStartAlpha(map(frameCount, scene1, scene2, 200, 0));
    
  pushMatrix();
  pg.beginDraw();
  int cols, rows;
  int scale = 15;
  int w=1920;
  int h=1080;
  //int prova=0;
  float flying=0;
  float[][] terrain;
  float scala = -0.5;
  cols = w/scale;
  rows = h/scale;
  terrain = new float[cols][rows];
  flying -= 0.01;
  float yoff = flying;
  for (int y=0; y<rows; y++) {
    float xoff = 0;
    for (int x=0; x<cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -50, 50);
      xoff+=0.02;
    }
    yoff+=0.1;
  }
 
 
  pg.translate(width/2, map(frameCount, scene1, scene2, height-height/6, height/2+height/12));
  pg.rotateX(PI/2.5);
  
  
  pg.translate(-w/2, -h/1000); 
  
  pg.noStroke();
  for (int y=0; y<rows -1; y++) {
    
    pg.beginShape(TRIANGLE_STRIP);
    
    for (int x=0; x<cols; x++) {
      pg.fill(70, 130, 180);
      pg.vertex(x*scale, y*scale, terrain[x][y]);
      pg.fill(0, 0, 100);
      pg.vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
  
    }
    pg.endShape();
  }
  pg.endDraw();
  image(pg, 0, 0);
  popMatrix();
  
    pushMatrix();
      
    
    
    

    //translate(width/2, height/2);
    //scale(map(frameCount, scene1, scene2, 1, 4));
    //translate(-width/2, -height/2);

    montagne[0][0].setColour(lerpColor(color(242, 176, 102), color(255, 132, 0), 0.3));
    montagne[0][1].setColour(lerpColor(color(242, 176, 102), color(255, 132, 0), 0.3));
    montagne[1][0].setColour(lerpColor(color(177, 91, 58), color(255, 132, 0), 0.3));
    montagne[1][1].setColour(lerpColor(color(177, 91, 58), color(255, 132, 0), 0.3));
    montagne[2][0].setColour(lerpColor(color(110, 44, 28), color(255, 132, 0), 0.3));
    montagne[2][1].setColour(lerpColor(color(110, 44, 28), color(255, 132, 0), 0.3));
    montagne[3][0].setColour(lerpColor(color(50, 19, 25), color(255, 132, 0), 0.3));
    montagne[3][1].setColour(lerpColor(color(50, 19, 25), color(255, 132, 0), 0.3));
    
    for (Montagna[] m : montagne) {
      m[0].move(int(map(frameCount, scene1, scene2, 0, 7)), Direction.UP);
      m[1].move(int(map(frameCount, scene1, scene2, 0, 7)), Direction.UP);
    }
    
    for (int i = 3; i >= 0; i--) {
      montagne[i][0].display();
      montagne[i][1].display();
    }

    popMatrix();
    
  }

  /*
  if ( frameCount > scene1 && frameCount <= scene2) {
    background(lerpColor(color(38, 42, 90), color(#0d0f16), map(frameCount, scene1, scene2, 0, 1)), map(frameCount, scene1, scene2, 100, 0));
    
    pushMatrix();
    translate(width/2, height/4 - 100);
    cieloGrande.display((int)map(frameCount, (scene2-scene1)/2+scene1, scene2, 0, 255));  
    popMatrix();    
    
    s.setY(map(frameCount, scene1, scene2, m4.getLastY(), height));
    s.setR2(map(frameCount, scene1, scene2, 900, 300));
    s.display();
    
    m4.display(lerpColor(color(150, 150, 150), color(#0d0f16), map(frameCount, scene1, scene2, 0, 0.6)));
    m44.display(lerpColor(color(150, 150, 150), color(#0d0f16), map(frameCount, scene1, scene2, 0, 0.6)));
    m3.display(lerpColor(color(122, 122, 122), color(#0d0f16), map(frameCount, scene1, scene2, 0, 0.6)));
    m33.display(lerpColor(color(122, 122, 122), color(#0d0f16), map(frameCount, scene1, scene2, 0, 0.6)));
    m2.display(lerpColor(color(105, 105, 105), color(#0d0f16), map(frameCount, scene1, scene2, 0, 0.6)));
    m22.display(lerpColor(color(105, 105, 105), color(#0d0f16), map(frameCount, scene1, scene2, 0, 0.6)));
    m1.display(lerpColor(color(84, 84, 84), color(#0d0f16), map(frameCount, scene1, scene2, 0, 0.6)));
    m11.display(lerpColor(color(84, 84, 84), color(#0d0f16), map(frameCount, scene1, scene2, 0, 0.6)));

  }
  
  if ( frameCount > scene2 && frameCount <= scene3){
    fill(color(13, 15, 22), map(frameCount, scene2, scene3, 10, 2));
    rect(0, 0, width, height);
    pushMatrix();
    translate(width/2, height/4 - 100);
    cieloGrande.display((int)map(frameCount, (scene2-scene1)/2+scene1, scene2, 0, 255));  
    popMatrix();    
    
    m4.display(lerpColor(color(150, 150, 150), color(#0d0f16), 0.8));
    m44.display(lerpColor(color(150, 150, 150), color(#0d0f16), 0.8));
    m3.display(lerpColor(color(122, 122, 122), color(#0d0f16), 0.8));
    m33.display(lerpColor(color(122, 122, 122), color(#0d0f16), 0.8));
    m2.display(lerpColor(color(105, 105, 105), color(#0d0f16), 0.8));
    m22.display(lerpColor(color(105, 105, 105), color(#0d0f16), 0.8));
    m1.display(lerpColor(color(84, 84, 84), color(#0d0f16), 0.8));
    m11.display(lerpColor(color(84, 84, 84), color(#0d0f16), 0.8));
  }
  
  if (frameCount > scene3 && frameCount <= scene4){
  
    background(lerpColor(color(#0d0f16), color(38, 42, 90), map(frameCount, scene3, scene4, 1, 0)), map(frameCount, scene3, scene4, 0, 100));
    
    pushMatrix();
    translate(width/2, height/4 - 100);
    popMatrix();    
    
    s.setY(map(frameCount, scene3, scene4, 0 - height, m4.getLastY()));
    s.setR2(map(frameCount, scene3, scene4, 300, 900));
    s.display();
    
    m4.display(lerpColor(color(#0d0f16), color(150, 150, 150), map(frameCount, scene3, scene4, 0, 0.6)));
    m44.display(lerpColor(color(#0d0f16), color(150, 150, 150), map(frameCount, scene3, scene4, 0, 0.6)));
    m3.display(lerpColor(color(#0d0f16), color(122, 122, 122), map(frameCount, scene3, scene4, 0, 0.6)));
    m33.display(lerpColor(color(#0d0f16), color(122, 122, 122), map(frameCount, scene3, scene4, 0, 0.6)));
    m2.display(lerpColor(color(#0d0f16), color(105, 105, 105), map(frameCount, scene3, scene4, 0, 0.6)));
    m22.display(lerpColor(color(#0d0f16), color(105, 105, 105), map(frameCount, scene3, scene4, 0, 0.6)));
    m1.display(lerpColor(color(#0d0f16), color(84, 84, 84), map(frameCount, scene3, scene4, 0, 0.6)));
    m11.display(lerpColor(color(#0d0f16), color(84, 84, 84), map(frameCount, scene3, scene4, 0, 0.6)));
    
  }
  */
  
  //saveFrame("frames/line-####.tif"); 

}
