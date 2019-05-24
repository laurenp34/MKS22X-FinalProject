import java.util.Random;

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
        userBoard.getBoard()[r][c].displaySquareUser();
      }
   }
  }
  
  public void displayCompBoard(){
    for (int r = 0; r < 10; r++) {
      for (int c = 0; c < 10; c++) {
        vCompBoard.getBoard()[r][c].displaySquareComp();
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
           if (compBoard.getBoard()[r][c].attack()) {
              compBoard.addAttacked();
              return true;
             
           } 
           return false;//false if already attacked
       }
     }
     return false;// mouse wasn't pressed or wasn't on the board.
  }
  public boolean turnOver(int num){
    for (int y = 0; y < compBoard.getBoard().length; y++){
       for (int x = 0; x < compBoard.getBoard()[0].length; x++){
         if (num == 0){
            if (compBoard.getBoard()[y][x].isAttacked() == true &&
                 compBoard.getBoard()[y][x].wasAttacked() == false){
               compBoard.getBoard()[y][x].changeWasAttacked();
                return true;
                 }
         }
         else{
            if (userBoard.getBoard()[y][x].isAttacked() == true &&
                 userBoard.getBoard()[y][x].wasAttacked() == false){
               userBoard.getBoard()[y][x].changeWasAttacked();
               return true;
              }
           }
       }
    }
    return false;
  }
  
  public boolean compChooseSquare(){
    int xcor = (int)Math.random() * 10;
    int ycor = (int)Math.random() * 10;
    return userBoard.getBoard()[ycor][xcor].attack();
}
}