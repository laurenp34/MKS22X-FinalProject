class Ship {
  int size;
  int x1;
  int y1;
  int x2;
  int y2;
  int dir; //vertical is 0, horizontal is 1. 
  boolean alive; 
  boolean placed;
  
  public Ship(int newSize, int xcor, int ycor){ 
    size = newSize; 
    dir = (int) (Math.random() * 2); // choose 1 or 0 randomly.
    //for first part of development, ship's xy are chosen randomly too
    
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
