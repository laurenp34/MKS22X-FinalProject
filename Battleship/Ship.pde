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

  //setup positions:
  float startx;
  float starty;

  float x1; //top-most, left-most coordinates
  float y1; //useful before ship gets matched to a square w/ r,c
  //later, ^^these coordinates are the same as squares[0]'s

  Square[] squares;

  int dir; //vertical is 0, horizontal is 1. 

  boolean alive; 
  boolean placed;

  //drag info:
  boolean dragged;
  float xdist;
  float ydist;
  PImage p;


  public Ship(int newSize) {
    alive = true;
    size = newSize; 
    squares = new Square[size];
    dir = (int) (Math.random() * 2); // choose 1 or 0 randomly.
    setImg();
  }

  public Ship(int newSize, int r, int c) { 
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
    setImg();
  }

  public void setImg() {
    if (size == 3) {
      //horizontal ship
      if (dir == 1) {
        if (alive) {
          p = loadImage("ship3.png");
        } else p = loadImage("ship3dead.png");
      } else {
        if (alive) {
          p = loadImage("ship3up.png");
        } else p = loadImage("ship3updead.png");
      }
    }
    if (size == 2) {
      //horizontal ship
      if (dir == 1) {
        if (alive) p = loadImage("ship2.png");
      } else {
        if (alive) p = loadImage("ship2up.png");
      }
    }
    if (size == 4) {
      //horizontal ship
      if (dir == 1) {
        if (alive) p = loadImage("ship4.png");
      } else {
        if (alive) p = loadImage("ship4up.png");
      }
    }
    if (size == 5) {
      //horizontal ship
      if (dir == 1) {
        if (alive) p = loadImage("ship5.png");
      } else {
        if (alive) p = loadImage("ship5up.png");
      }
    }
  }

  public void rot() {
  }

  public void clearSquares() {
    if (placed) {
      for (int i=0; i<squares.length; i++) {
        squares[i].hasShip = false;
      }
    }
  }

  public void display() {
    //get top-most, left-most x and y coordinates (use ship's square array)
    //int x1 = squares[0].getX();
    //int y1 = squares[0].getY();
    if (dir == 1) image(p, x1, y1, (70 * size), 70);  
    else image(p, x1, y1, 70, (70 * size));
  }

  public void addSquare(int idx, Square sq) {
    squares[idx] = sq;
  }

  public void setXY(float x, float y) {
    x1 = x;
    y1 = y;
  }

  public void setStartXY(float x, float y) {
    startx = x;
    starty = y;
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
