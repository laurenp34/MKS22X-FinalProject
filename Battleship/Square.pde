  class Square {
  int x1; //x1 and y1 represent the upper left coordinates of the square
  int y1;
  int r;
  int c; //represent coordinates in board array
  boolean hasShip;
  boolean fullShipFound; //if there is a ship here, has that ship been fully found
  boolean attacked;
  Ship shipHere;

  public Square(int x, int y) {
    x1 = x;
    y1 = y;
    attacked = false;
    fullShipFound = false;
    hasShip = false;
  }

  public void setRC(int re, int ce) {
    r = re;
    c = ce;
  }

  public boolean isShipHere() {
    return hasShip;
  }

  public int getX() {
    return x1;
  }
  public int getY() {
    return y1;
  }

  public void addShipHere(Ship newShip) {
    shipHere = newShip;
    attacked = false;
    hasShip = true;
  }

  public boolean attack() {
    if (!attacked) {
      attacked = true;
      if (hasShip) shipHere.attack();
      return true;
    }
    return false; // already attacked
  }

  public boolean isAttacked() {
    return attacked;
  }


  //continuous method to be run in draw()
  public void displaySquareUser() {
    if (hasShip && attacked && !fullShipFound) {
      PImage p;
      p = loadImage("fire.png");
      image(p, x1, y1, 70, 70);
    } else if (attacked && !fullShipFound) {
      fill(0, 0, 255);
      rect(x1, y1, 70, 70);
    }
    //textFont(f,16);   
  //fill(255);
  //text("" +attacked, x1,y1 + 20);
  }

  public void displaySquareComp() {
    if (!attacked) {
      stroke(255);
      fill(0);
      rect(x1, y1, 70, 70);
    } else if (hasShip) {
      //if the square is attacked, and has a partially attacked ship underneath, print fire ( to not reveal ship's direction)
      if (!fullShipFound) {
        //print fire
        PImage p;
        p = loadImage("fire.png");
        image(p, x1, y1, 70, 70);
      } //if the full ship is found, just print the ship.
  }
  }
  
  public void displayUserSquareTest(){
    fill(0,0,255);
    if (hasShip) fill(255,0,0);
    rect(x1,y1,70,70);
  }
  
  public void displayCompSquareTest() {
    fill(0,0,255);
    if (hasShip) fill(255,0,0);
    rect(x1,y1,70,70);
  }
}
