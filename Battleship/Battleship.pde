
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
    
  }
  
}

class GameBoard {
  Square[][] board;
  int rows;
  int cols;
  Ship[] ships;
  
  public GameBoard(){
    rows = 10; 
    cols = 10;
    board = new Square[10][10];
    for (int i=0;i<10;i++) {
      for (int i2=0;i2<10;i2++) {

      }
      
    }
  }
  
  public void showBoard() {
    fill(0,0,0);
    rectMode(RADIUS);
    rect(width/2, height/2, 300,300);
  }
}

class Game {
  GameBoard board1;
  GameBoard board2;
  int turns;
  
  public Game() {
   turns = 0; 
  }
  
  
}

void setup() {
  size(1000,800);
  GameBoard b = new GameBoard();
  b.showBoard();
}
void draw() {
  
}
