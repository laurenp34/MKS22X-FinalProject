
class Ship {
  int size;
  int x1;
  int y1;
  int x2;
  int y2;
  int dir; //vertical is 0, horizontal is 1. 
  boolean alive;
  boolean placed;
  
  public Ship(int newSize){ 
    size = newSize; 
    dir = (int) (Math.random() * 2); // choose 1 or 0 randomly.
    //for first part of development, ship's xy are chosen randomly too
    
  }
  
  public void show() {
    
  }
  
}
class Square {
  int xcor;
  int ycor;
  boolean hasShip;
  boolean attacked;
  Ship shipHere;
  
  public Square(int x, int y) {
    xcor = x;
    ycor = y;
    attacked = false;
    hasShip = false;
  }
  
  public boolean isShipHere(){
    return hasShip;
  }
  
  public int addShipHere(Ship newShip){
    shipHere = newShip;
    attacked = false;
    hasShip = true;
}

class GameBoard {
  Square[][] board;
  int rows;
  int cols;
  Ship[] ships;
  
  public GameBoard(int r, int c) {
    rows = r; 
    cols = c;
    board = new Square[r][c];
  }
  
  public void showBoard() {
    stroke(255);
    fill(0);
    for (int x=0; x < 10; x++) {
      for (int y=0; y < 10; y++) {
         square(x*70 + 150, y*70 + 50, 70);
      }
    }
  }
}

class Game {
  GameBoard compBoard;
  GameBoard vCompBoard;
  GameBoard userBoard;
  int turns;
  
  public Game(){
   turns = 0; 
   compBoard = new GameBoard(10, 10);
   vCompBoard = new GameBoard(10, 10);
   userBoard = new GameBoard (10, 10);
  }
   
}

void setup() {
  size(1000,800);
  GameBoard b = new GameBoard(10,10);
  b.showBoard();
}
void draw() {   
 
}
