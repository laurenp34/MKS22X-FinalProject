class Game {
  GameBoard compBoard;
  GameBoard vCompBoard;
  GameBoard userBoard;
  int turns;
  
  public Game(){
   turns = 0; 
   compBoard = new GameBoard();
   vCompBoard = new GameBoard();
   userBoard = new GameBoard();
  }
  public void setupShips(){
     userBoard.placeShipsRandomly();
     compBoard.placeShipsRandomly();
  } 
  
  public void displayBoard(){
    for (int r = 0; r < 10; r++) {
      for (int c = 0; c < 10; c++) {
        userBoard.getBoard()[r][c].displaySquare();
      }
   }
  }
  
  public void displayCompBoard(){
    for (int r = 0; r < 10; r++) {
      for (int c = 0; c < 10; c++) {
        vCompBoard.getBoard()[r][c].displaySquare();
      }
   }
  }
  
  public void attack() {
     if (mousePressed) {
       if (mouseX 
     }
  }
  
  public boolean turnOver(){
    // should check if any of the squares have been changed
    return false;
  }
}