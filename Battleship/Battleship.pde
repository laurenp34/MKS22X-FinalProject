class Game {
  Board board1;
  Board board2;
  int turns;
  
  public Game() {
   turns = 0; 
  }
  
  
}

class GameBoard {
  Square[][] board;
  int rows;
  int cols;
  Ship[] ships;
  
}

class Ship {
  int size;
  int x1;
  int x2;
  int y1;
  int y2;
  int dir; //vertical is 0, horizontal is 1. 
  boolean alive;
  boolean placed;
  
  public Ship(int newSize){ 
    size = newSize; 
    dir = (int) (Math.random() * 2); // choose 1 or 0 randomly.
    //for first part of development, ship's xy are chosen randomly too
    
  }
  
  public show() {
    
    
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
