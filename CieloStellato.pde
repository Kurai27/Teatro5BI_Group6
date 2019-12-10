/** Classe CieloStellato
  *
  * @author Luciano Mateias
*/

class CieloStellato {

  private Sole[] stelle;
  
  // Possibili colori di una stella
  private color[] coloreStelle;
  
  /*
    TODO: Costruire la classe Stella che estenda PuntoLuminoso
  */
  private float[] raggioStelle;
  
  // Distanza dal centro di ognuna delle stelle
  private float[] distanzaStelle;
  
  // Angoli delle stelle
  private float[] angoloStelle;


  /** Crea un cielo stellato */
  public CieloStellato() {

   this(
    int(random(1, 30)),
    new color[] {
     color(157, 180, 255), color(167, 188, 255), color(175, 195, 255),
     color(192, 209, 255), color(228, 232, 255), color(251, 248, 255),
     color(255, 245, 236), color(255, 241,223), color(255, 215, 174),
     color(255, 190, 127), color(255, 187, 123)
    },
    0, 15, PI, 2 * PI);

  }
  
  /** Crea un cielo stellato con un
    * numero variabile di stelle
    *
    * @param numStelle numero di stelle del cielo
  */
  public CieloStellato(int numStelle){
    
   this(
    numStelle,
    new color[] {
     color(157, 180, 255), color(167, 188, 255), color(175, 195, 255),
     color(192, 209, 255), color(228, 232, 255), color(251, 248, 255),
     color(255, 245, 236), color(255, 241,223), color(255, 215, 174),
     color(255, 190, 127), color(255, 187, 123)
    },
    0, 15, PI, 2 * PI);
    
  }
  
  /** Crea un cielo stellato con un
    * numero variabile di stelle e con
    * colori prestabiliti
    * 
    * @param numStelle numero di stelle del cielo
    * @param coloreStelle lista dei colori per le stelle
  */
  public CieloStellato(int numStelle, color[] coloreStelle){
    
   this(numStelle, coloreStelle, 0, 15, PI, 2 * PI);
    
  }
  
  /** Crea un cielo stellato con un
    * numero variabile di stelle e con
    * colori prestabiliti. Il raggio delle stelle
    * va da minR a maxR.
    * 
    * @param numStelle numero di stelle del cielo
    * @param coloreStelle lista dei colori per le stelle
    * @param minR raggio minimo raggiungibile di una stella
    * @param maxR raggio massimo raggiungibile da una stella
  */
  public CieloStellato(int numStelle, color[] coloreStelle, float minR, float maxR){
    
   this(numStelle, coloreStelle, minR, maxR, PI, 2 * PI);
    
  }

  /** Crea un cielo stellato con un
    * numero variabile di stelle e con
    * colori prestabiliti. Il raggio delle stelle
    * va da minR a maxR.
    * 
    * @param numStelle numero di stelle del cielo
    * @param coloreStelle lista dei colori per le stelle
    * @param minR raggio minimo raggiungibile di una stella
    * @param maxR raggio massimo raggiungibile da una stella
    * @param minAngle (espresso in radianti) angolo minimo da cui parte la stella
    * @param maxAngle (espresso in radianti) angolo massimo a cui può arrivare la stella
  */
  public CieloStellato(int numStelle, color[] coloreStelle, float minR, float maxR, float minAngle, float maxAngle) {
    
    this.stelle = new Sole[numStelle];
    this.coloreStelle = coloreStelle;
    
    this.raggioStelle = new float[numStelle];
    this.angoloStelle = new float[numStelle];
    this.distanzaStelle = new float[numStelle];
    
     for (int i = 0; i < numStelle; i++) {
      this.raggioStelle[i] = random(minR, maxR);
      this.angoloStelle[i] = random(minAngle, maxAngle);
      
      this.distanzaStelle[i] = random(-height / 4, height / 4);
      
      this.stelle[i] = new Sole(0, 0, 0, this.raggioStelle[i], 200, 100, randomColoreStella(), randomColoreStella());
    }
  }

  public void display(){
    for(int i = 0; i < this.getNumStelle(); i++){
      this.stelle[i].setX((height + this.distanzaStelle[i] + random(2)) * cos(this.angoloStelle[i]) + this.raggioStelle[i]);
      this.stelle[i].setY((height / 2 + this.distanzaStelle[i] + random(2)) * sin(angoloStelle[i]) + this.raggioStelle[i]);
      
      this.stelle[i].display();
      
      this.angoloStelle[i] += 0.005;
    }
  }
    
  public int getNumStelle(){
    return this.stelle.length;
  }

  public color randomColoreStella() {
    return this.coloreStelle[int(random(this.coloreStelle.length))];
  }
}
