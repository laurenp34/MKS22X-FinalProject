import java.util.Random;

class Game {
  GameBoard compBoard;
  GameBoard userBoard;
  int turns;
  //PFont f; 
  
  public Game(){
    //f = createFont("Arial",16,true); // STEP 2 Create Font
   turns = 0; 
   compBoard = new GameBoard();
   userBoard = new GameBoard();
  }
  public void setupShips(){
     userBoard.placeShipsRandomly();
     compBoard.placeShipsRandomly();
  } 
  
  public void displayBoard(PFont f){
    userBoard.setupBoard();
    
    fill(0,255,0);
    rect(0,80,150,30);
    
    textFont(f,16);                  // STEP 3 Specify font to be used
    fill(0);                         // STEP 4 Specify font color 
    text("User Board",10,100);   // STEP 5 Display Text

    for (int r = 0; r < 10; r++) {
      for (int c = 0; c < 10; c++) {
        userBoard.getBoard()[r][c].displaySquareUser();
      }
   }
  }
  
  public void displayCompBoard(PFont f){
    compBoard.setupBoard();
    
    fill(0,255,0);
    rect(0,80,150,30);
    
    textFont(f,16);                  // STEP 3 Specify font to be used
    fill(0);                         // STEP 4 Specify font color 
    text("Comp Board",10,100);   // STEP 5 Display Text
    
    for (int r = 0; r < 10; r++) {
      for (int c = 0; c < 10; c++) {
        compBoard.board[r][c].displaySquareComp();
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
           //System.out.println(compBoard.getBoard()[c][r].hasShip);
           if (compBoard.board[c][r].attack()) {
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
    int xcor = (int) (Math.random() * 10);
    int ycor = (int) (Math.random() * 10);
    if (userBoard.board[ycor][xcor].attack()) {
          userBoard.addAttacked();
          return true;  
   } 
   return false;
}

  public boolean compChoose() {
   ArrayList<Integer> spots = new ArrayList<Integer>();
   //loop through all squares in user board
   for (int r=0;r<10;r++){
      for(int c=0;c<10;c++) {
        //if the square has not been attacked yet, add it to the list of available spots to attack
        if (userBoard.board[r][c].isAttacked()) {
           spots.add(r);
           spots.add(c);
        }
      }     
   }
   int i = (int) (Math.random() * (spots.size()/2));
   int i1 = i*2;
   int i2 = i1+1;
   
   if (userBoard.board[i1][i2].attack()) {
     userBoard.addAttacked();
     return true;
   }
   return false;
 }

  public void displayTurns(int t, PFont f) {
    fill(0,255,0);
    rect(width/2-10,0,60,20);
    
    textFont(f,15);                  // STEP 3 Specify font to be used
    fill(0);                         // STEP 4 Specify font color 
    text(""+t,width/2,15);   // STEP 5 Display Text
  }
}
