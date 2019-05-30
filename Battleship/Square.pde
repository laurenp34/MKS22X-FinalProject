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
    if (hasShip) {
      //if the square is occupied by a ship color it red (early development)
      if (attacked) {   
        fill(255, 0, 0);
        rect(x1, y1, 70, 70);
      } else {
        fill(150);
        rect(x1, y1, 70, 70);
      }
      if (fullShipFound) {
        fill(244,164,96);
        rect(x1,y1,70,70);
      }
    } else if (attacked) {
      fill(0, 0, 255);
      rect(x1, y1, 70, 70);
    }
  }

  public void displaySquareComp() {
    if (attacked) {
      if (fullShipFound) {
        fill(244,164,96);
        rect(x1, y1, 70, 70);
      }
      else if (hasShip) {
        fill(255, 0, 0);
        rect(x1, y1, 70, 70);
      } else {
        fill(0, 0, 255);
        rect(x1, y1, 70, 70);
      }
    }
  }
}
