class Ship {
  int size;
  //**** coordinates refer to indices in Square[][] array, not x or y
  //(r1,c1) is top-most, left-most coordinate
  int r1;
  int c1;
  //(r2,c2) is bottom-most, right-most coordinate
  int r2;
  int c2;
  
  int dir; //vertical is 0, horizontal is 1. 
  
  boolean alive; 
  boolean placed;
  
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
  
  public void show() {
    
  }
  
  public int getSize() {
    return size;
  }
  
  public int getDir() {
    return dir;
  }
  
}