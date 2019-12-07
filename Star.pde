class Star{

  int x;
  int y;
  int r;
  int colour;
  
  Star(int x, int y, int r, int colour){
    this.x = x;
    this.y = y;
    this.r = r;
    this.colour = colour;
  }
  
  void display(){
    fill(this.colour);
    noStroke();
    
    int tempR = this.r;
    fill(color(255, 255, 255, map(tempR, 0, this.r, 1, 0)));
    ellipse(this.x, this.y, this.r, tempR);
    tempR += 1;
    
    noFill();
  }
  
  int getX(){
    return this.x;
  }
  
  int getY(){
    return this.y;
  }
  
  int getR(){
    return this.r;
  }
  
  void setX(int x){
    this.x = x;
  }
  
  void setY(int y){
    this.y = y;
  }
  
  void setR(int r){
    this.r = r;
  }

}
