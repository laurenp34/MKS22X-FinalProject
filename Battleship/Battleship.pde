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
  Ship[] ships;
  
}

class Ship {
  int size;
  int startRow;
  int startCol;
  int endRow;
  int endCol;
  int dir 
  boolean alive;
  boolean placed;
  
  public Ship(int newSize){ 
    size = newSize; 
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
