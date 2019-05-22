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
  
  public boolean userChooseSquare() {
     if (mousePressed) {
       //check to see if the mouse clicks within the square
       //also check to see that you didn't click directly on a border
       if (mouseX >=150 && mouseX <= 850 && mouseY >= 50 && mouseY <= 750 && (mouseX-150) % 70 != 0 && (mouseY-50) % 70 != 0) {
           int r = (mouseY - 50) / 70;
           int c = (mouseX - 150) / 70;
       }
       return userBoard[r][c].attack(); //false if already attacked
     }
     return false;// mouse wasn't pressed or wasn't on the board.
  
  public boolean turnOver(){
    // should check if any of the squares have been changed
    return false;
  }
}