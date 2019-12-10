/** Crea un oggetto sole
  *
  * @author Ovidiu Costin Andrioaia
*/

class Sole {
  
  // Coordinate dell'oggetto
  private float x, y;
  
  // Raggio di sole e luce
  private float r1, r2;
  
  // Intensità della luce da r1 a r2
  private float startAlpha, endAlpha;
  
  // Colore del sole
  private color coloreSole, coloreLuce;
  
  
  /** Crea un sole di centro (x,y) e raggio r1
   *
   * @param x Coordinata X del Sole.
   * @param y Coordinata Y del Sole.
   * @param r1 Raggio del Sole.
   * @param colore il colore del Sole.
  */
  
  public Sole(float x, float y, float r1, color coloreSole) {
    
    // Assegnazione delle variabili prese in input
    this.x = x;
    this.y = y;
    this.r1 = r1;
    this.coloreSole = coloreSole;
  }
  
  /** Crea un sole di centro (x,y) e raggio r1,
    * seguito da una luce sotto forma di gradiente
    * che si estende da r1 a r2, che parte con una 
    * trasparenza startAlpha, finendo con una endAlpha
    *
    * @param x Coordinata X del Sole.
    * @param y Coordinata Y del Sole.
    * @param r1 Raggio del Sole.
    * @param r2 Raggio della Luce.
    * @param startAlpha Intensità con cui parte la luce del sole da r1.
    * @param endAlpha Intensità a cui arriverà la luce del sole a r2.
    * @param colore il colore del Sole.
  */
  
  public Sole (float x, float y, float r1, float r2,  float startAlpha, float endAlpha, color coloreSole, color coloreLuce) {
    
    // Assegnazione delle variabili prese in input
    this.x = x;
    this.y = y;
    this.r1 = r1;
    this.r2 = r2;
    this.startAlpha = startAlpha;
    this.endAlpha = endAlpha;
    this.coloreSole = coloreSole;
    this.coloreLuce = coloreLuce;
    
  }
  
  public void display() {
    
    ellipseMode(RADIUS);
    
    // Disegno il sole
    stroke(this.coloreLuce);
    fill(this.coloreSole);
    ellipse(this.x, this.y, this.r1, this.r1); 
    noFill();
    
    // Disegno la luce tramite creando cerchi vuoti in un ciclo, e abbassando l'alpha del loro bordo
    // colorato man mano che si procede verso l'esterno
    for (float i = this.r1; i < this.r2; i++) {
      float alpha = map(i, this.r1, this.r2, this.startAlpha, this.endAlpha);
      stroke(this.coloreLuce, alpha);
      ellipse(this.x, this.y, i, i); 
    }
    
  }

  public float getX(){
    return this.x;
  }
  
  public void setX(float x){
    this.x = x;
  }
  
  public float getY(){
    return this.y;
  }
  
  public void setY(float y){
    this.y = y;
  }

  public float getR1() {
    return this.r1;
  }

  public void setR1(float r1) {
    this.r1 = r1;
  }

  public float getR2() {
    return this.r2;
  }

  public void setR2(float r2) {
    this.r2 = r2;
  }

  public float getStartAlpha() {
    return this.startAlpha;
  }

  public void setStartAlpha(float startAlpha) {
    this.startAlpha = startAlpha;
  }

  public float getEndAlpha() {
    return this.endAlpha;
  }

  public void setEndAlpha(float endAlpha) {
    this.endAlpha = endAlpha;
  }

  public color getColoreSole() {
    return this.coloreSole;
  }

  public void setColoreSole(color coloreSole) {
    this.coloreSole = coloreSole;
  }
  
  public color getColoreLuce() {
    return this.coloreLuce;
  }
  
  public void setColoreLuce(color coloreLuce) {
    this.coloreLuce = coloreLuce;
  }
  
}
