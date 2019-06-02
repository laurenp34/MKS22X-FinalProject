class Ship {
  int size;
  int attacks;
  //**** coordinates refer to indices in Square[][] array, not x or y
  //(r1,c1) is top-most, left-most coordinate
  int r1;
  int c1;
  //(r2,c2) is bottom-most, right-most coordinate
  int r2;
  int c2;
  
  int x1; //top-most, left-most coordinates
  int y1; //useful before ship gets matched to a square w/ r,c
  //later, ^^these coordinates are the same as squares[0]'s
  
  Square[] squares;
  
  int dir; //vertical is 0, horizontal is 1. 
  
  boolean alive; 
  boolean placed;
  
  public Ship(int newSize) {
    alive = true;
    size = newSize; 
    squares = new Square[size];
    dir = (int) (Math.random() * 2); // choose 1 or 0 randomly.
  }
  
  public Ship(int newSize, int r, int c){ 
    r1=r;
    c1=c;
    size = newSize; 
    dir = (int) (Math.random() * 2); // choose 1 or 0 randomly.
    //for first part of development, ship's xy are chosen randomly too
    if (dir==0) { //vertical
      r2=r;
      c2=c1+size-1;
    } else { //horizontal
      r2=r1+size-1;
      c2=c; 
    }
  }
  
  public void display() {
    PImage p;
      //get top-most, left-most x and y coordinates (use ship's square array)
      //int x1 = squares[0].getX();
      //int y1 = squares[0].getY();
      if (size == 3) {
        //horizontal ship
        if (dir == 1) {
          if (alive) {
            p = loadImage("ship3.png");
            //else p = loadImage("ship3.png");
            image(p, x1, y1, 210, 70);
          }
        } else {
          if (alive) {
            p = loadImage("ship3up.png");
            // else p = loadImage("ship3up.png");
            image(p, x1, y1, 70, 210);
          }
        }
      }
      if (size == 2) {
        //horizontal ship
        if (dir == 1) {
          if (alive) p = loadImage("ship2.png");
          else p = loadImage("ship3.png");
          image(p, x1, y1, 140, 70);
        } else {
          if (alive) p = loadImage("ship2up.png");
          else p = loadImage("ship3up.png");
          image(p, x1, y1, 70, 140);
        }
      }
      if (size == 4) {
        //horizontal ship
        if (dir == 1) {
          if (alive) p = loadImage("ship4.png");
          else p = loadImage("ship3.png");
          image(p, x1, y1, 280, 70);
        } else {
          if (alive) p = loadImage("ship4up.png");
          else p = loadImage("ship3up.png");
          image(p, x1, y1, 70, 280);
        }
      }
      if (size == 5) {
        //horizontal ship
        if (dir == 1) {
          if (alive) p = loadImage("ship5.png");
          else p = loadImage("ship3.png");
          image(p, x1, y1, 350, 70);
        } else {
          if (alive) p = loadImage("ship5up.png");
          else p = loadImage("ship3up.png");
          image(p, x1, y1, 70, 350);
        }
      } 
    
    
  }
  
  public void addSquare(int idx, Square sq) {
   squares[idx] = sq; 
  }
  
  public void setXY(int x,int y) {
   x1 = x;
   y1 = y;
  }
  
  //update x and y coordinates after ship is placed on a square
  //matched to squares[0]
  public void updateXY() {
    x1 = squares[0].getX();
    y1 = squares[0].getY();
  }
  
  public void setLocation(int r, int c) {
    r1 = r;
    c1 = c;
  }
  
  public int getSize() {
    return size;
  }
  public int getDir() {
    return dir;
  }
  public int getR1() {
    return r1;
  }
  public int getR2() {
    return r2;
  }
  public int getC1() {
    return c1;
  }
  public int getC2() {
    return c2;
  }
  
  public int getAttacks() {
    return attacks;
  }
  public void attack() {
    attacks++;
  }
  
}
