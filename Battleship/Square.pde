class Square {
  int x1; //x1 and y1 represent the upper left coordinates of the square
  int y1;
  boolean hasShip;
  boolean attacked;
  Ship shipHere;
  
  public Square(int x, int y) {
    x1 = x;
    y1 = y;
    attacked = false;
    hasShip = false;
  }
  
  public boolean isShipHere(){
    return hasShip;
  }
  
  public int getX() {
    return x1;
  }
  public int getY() {
    return y1;
  }
  
  public void addShipHere(Ship newShip){
    shipHere = newShip;
    attacked = false;
    hasShip = true;
  }
  
  public boolean attack() {
     if (!attacked) {
       attacked = true;
       return true;
     }
     return false; // already attacked
  }
  
  //continuous method to be run in draw()
  public void displaySquare() {
   if (hasShip) {
     //if the square is occupied by a ship color it red (early development)
    fill(255,0,0);
    rect(x1,y1,70,70);
   }
  }
  
}