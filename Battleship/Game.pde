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
           if (compBoard.attack(c,r)) {
              compBoard.addAttacked();
              return true;
             
           } 
           return false;//false if already attacked
       }
     }
     return false;// mouse wasn't pressed or wasn't on the board.
  }
  /*
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
  }*/
  
  public boolean compChooseSquare(){
    int xcor = (int) (Math.random() * 10);
    int ycor = (int) (Math.random() * 10);
    if (userBoard.getHits() > 0){
          int x = userBoard.lastHitX();
          int y = userBoard.lastHitY();
          ArrayList<int[]> coords = new ArrayList<int[]>();
          if (x > 0 && !userBoard.getSquare(x-1,y).isAttacked()){
            int[] coor = {x-1, y};
            coords.add(coor);
          }
          if (x < 9 && !userBoard.getSquare(y,x+1).isAttacked()){
            int[] coor = {x+1, y};
            coords.add(coor);
          }
          if (y > 0 && !userBoard.getSquare(y-1, x).isAttacked()){
            int[] coor = {x, y-1};
            coords.add(coor);
          }
          if (y < 9 && !userBoard.getSquare(y+1,x).isAttacked()){
            int[] coor = {x, y+1};
            coords.add(coor);
          }
          int target = (int)Math.random() * coords.size();
          int[] myCoor = coords.get(target);
          int myX = myCoor[0];
          int myY = myCoor[1];
          if (userBoard.attack(myY, myX)) {
            userBoard.addAttacked();
            return true;
          }
    }
    else if (userBoard.attack(ycor,xcor)) {
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
        if (!userBoard.board[r][c].isAttacked()) {
           spots.add(r);
           spots.add(c);
        }
      }     
   }
   int i = (int) (Math.random() * (spots.size()/2));
   int i1 = i*2;
   int i2 = i1+1;
   int r = spots.get(i1);
   int c = spots.get(i2);
   
   if (userBoard.board[r][c].attack()) {
     userBoard.addAttacked();
     return true;
   }
   return false;
 }

  public void displayTurns(int t, PFont f) {
    fill(0,255,0);
    rect(width/2-10,0,60,20);
    
    textFont(f,15);                  // STEP 3 Specify font to be used
    fill(0);                           // STEP 4 Specify font color 
    text(""+t,width/2,15);            // STEP 5 Display Text
  }
  
  
  //returns 0 if game is not over, 1 if user wins, 2 if computer won
  public int isGameOver() {
    boolean compWon = true;
    boolean userWon = true;
    for (int i=0;i<userBoard.ships.length;i++) { //both arrays are same length
        if (userBoard.ships[i].alive) {
          compWon = false; //a user ship is still alive ,, comp did not win
        }
        if (compBoard.ships[i].alive) {
           userWon = false; // a comp ship is alive. 
        }
        if (!userWon && !compWon) i = userBoard.ships.length; //break out of loop since none of them won
    }
   if (compWon) return 2;
   if (userWon) return 1;
   else return 0;
  }
  
  //whoWon: 1 is user, 2 is computer
  public void gameOver(int whoWon, PFont f) {
    fill(0,255,0);
    rect(height/2-100,width/2-20, 200,40);
    
    String t = "";
    if (whoWon == 1) t = "USER won!";
    if (whoWon == 2) t = "COMP won!";
    
    textFont(f,16);                  // STEP 3 Specify font to be used
    fill(0);     // STEP 4 Specify font color 
    text(t,height/2,width/2);   // STEP 5 Display Text
    
  }
}
