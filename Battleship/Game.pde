import java.util.Random;
import java.lang.Math;

class Game {
  GameBoard compBoard;
  GameBoard userBoard;
  int turns;
  boolean setup; //is it in setup mode?


  //PFont f; 
  int myX;
  int myY;

  public Game() {
    //f = createFont("Arial",16,true); // STEP 2 Create Font
    turns = 0; 
    compBoard = new GameBoard();
    userBoard = new GameBoard();

    setup = true;


    myX = 0;
    myY = 0;
  }
  public void setupShips() {
    userBoard.placeShipsRandomly();
    compBoard.placeShipsRandomly();
  } 

  public void displayBoard(PFont f) {
    //first, set up ocean
    background(255);
    if (setup) {
      checkButton();
      rotateButton();
    }
    userBoard.printOcean();
    userBoard.printGrid();

    userBoard.printShips();



    fill(0, 255, 0);
    rect(width/2 - 80, 0, 160, 30);

    textFont(f, 16);                  // STEP 3 Specify font to be used
    fill(0);                         // STEP 4 Specify font color 
    text("User's Board", width/2 - 50, 20);   // STEP 5 Display Text

/*
    fill(255);
    rect(0, 80, 150, 30);
    //rect(0,150,40,100);
    //rect(0, 0, 30, 60);
    //rect(0,260,40,40);
    textFont(f, 16);                  // STEP 3 Specify font to be used
    fill(0);                         // STEP 4 Specify font color 
    text("User Board", 10, 100);   // STEP 5 Display Text
    */
    //text(userBoard.getHits(),10,170);
    //text(userBoard.totalAttacks,10,200);
    //text(userBoard.lastHitY()+" "+userBoard.lastHitX(),10,230);
    //text("" + userBoard.getHits(),20,20);
    //text(myX + " " + myY,10,280);


    for (int r = 0; r < 10; r++) {
      for (int c = 0; c < 10; c++) {
        userBoard.getBoard()[r][c].displaySquareUser();
        textFont(f, 16);   
        fill(255);
        //text("" + userBoard.getBoard()[r][c].isAttacked(), r*70 + 150,c*70 + 50 + 20);
      }
    }
    if (setup) userBoard.printShips();
  }

  public void displayCompBoard(PFont f) {
    background(255);
    compBoard.printOcean();
    compBoard.printShipsDead();
    compBoard.printGrid();


    fill(0, 255, 0);
    rect(width/2 - 100, 0, 200, 30);

    /*
    fill(255);
     rect(0,80,150,30);*/


    textFont(f, 16);                  // STEP 3 Specify font to be used
    fill(0);                         // STEP 4 Specify font color 
    text("Computer's Board", width/2 - 75, 20);   // STEP 5 Display Text

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
        if (compBoard.attack(c, r)) {
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

  public boolean compChoose() {

    int xcor = (int) (Math.random() * 10);
    int ycor = (int) (Math.random() * 10);
    if (userBoard.getHits() > 0) {
    } else if (userBoard.attack(ycor, xcor)) {
      userBoard.addAttacked();
      return true;
    } 
    return false;
  }

  public boolean compChooseSquare() {

    //textFont(f,16);                  // STEP 3 Specify font to be used

    //fill(0);  

    //text("" + userBoard.getHits(),20,20);

    if (userBoard.getHits() == 1) {

      //textFont(f,16);                  // STEP 3 Specify font to be used

      //fill(0);                         // STEP 4 Specify font color 

      //text("hi",20,50);

      int x = userBoard.lastHitX();

      int y = userBoard.lastHitY();

      ArrayList<int[]> coords = new ArrayList<int[]>();

      if (x > 0 && !userBoard.getSquare(x-1, y).isAttacked()) {

        int[] coor = {y, x-1};

        coords.add(coor);
      }

      if (x < 9 && !userBoard.getSquare(x+1, y).isAttacked()) {

        int[] coor = {y, x+1};

        coords.add(coor);
      }

      if (y > 0 && !userBoard.getSquare(x, y-1).isAttacked()) {

        int[] coor = {y-1, x};

        coords.add(coor);
      }

      if (y < 9 && !userBoard.getSquare(x, y+1).isAttacked()) {

        int[] coor = {y+1, x};

        coords.add(coor);
      }

      /*
       rect(0,120,80,40);
       
       textFont(f,16);                  // STEP 3 Specify font to be used
       
       fill(0);                         // STEP 4 Specify font color 
       
       text("" +coords.size(), 20,140);
       
       fill(0,255,0);
       
       rect(0,300,150,40);
       
       String coor = "";
       
       for (int[] s : coords){
       
       coor += "{" + s[0] + "," + s[1] + "} ";
       
       }
       
       textFont(f,16);                  // STEP 3 Specify font to be used
       
       fill(0); 
       
       text(coor,10,330);
       
       */

      Random ran = new Random();

      int target = ran.nextInt(coords.size());

      int[] myCoor = coords.get(target);

      myX = myCoor[0];

      myY = myCoor[1];

      //text(myX + " " + myY,10,270);

      if (userBoard.attack(myY, myX)) {

        //System.out.println("hi");

        userBoard.addAttacked();

        return true;
      }
    } else if (userBoard.getHits() > 1) {

      ArrayList<int[]> hitsList = userBoard.getHitsList();

      if (hitsList.get(0)[0] == hitsList.get(1)[0]) {

        //it's vertical

        //find max and min of y-vals

        int ycor = hitsList.get(0)[0];

        int max = -1;

        int min = 11;

        for (int i = 0; i < hitsList.size(); i++) {

          if (hitsList.get(i)[1] > max) {

            max = hitsList.get(i)[1];
          }

          if (hitsList.get(i)[1] < min) {

            min = hitsList.get(i)[1];
          }
        }

        /*
         fill(0,255,0);
         
         rect(0,400,150,40);
         
         String hitsL = "";
         
         for (int[] s : hitsList){
         
         hitsL += "{" + s[0] + "," + s[1] + "} ";
         
         }
         
         textFont(f,16);                  // STEP 3 Specify font to be used
         
         fill(0); 
         
         text(hitsL,10,420);
         
         fill(0,255,0);
         
         rect(0,120,80,40);
         
         textFont(f,16);                  // STEP 3 Specify font to be used
         
         fill(0);                         // STEP 4 Specify font color 
         
         text(min + " " + max + " " + " " + ycor, 20,140);
         
         */

        ArrayList<int[]> coords = new ArrayList<int[]>();

        if (min > 0 && min <= 9 && !userBoard.getSquare(ycor, min - 1).isAttacked()) {

          int[] coor = {ycor, min - 1};

          coords.add(coor);
        }

        if (max < 9 && max >= 0 && !userBoard.getSquare(ycor, max + 1).isAttacked()) {

          int[] coor = {ycor, max + 1};

          coords.add(coor);
        }

        /*
         fill(0,255,0);
         
         rect(0,300,150,40);
         
         String coor = "";
         
         for (int[] s : coords){
         
         coor += "{" + s[0] + "," + s[1] + "} ";
         
         }
         
         textFont(f,16);                  // STEP 3 Specify font to be used
         
         fill(0); 
         
         text(coor,10,330);
         
         text(coords.size(), 10, 300);
         
         */

        Random ran = new Random();

        int rand = ran.nextInt(coords.size());

        if (userBoard.attack(ycor, coords.get(rand)[1])) {

          userBoard.addAttacked();

          return true;
        }
      } else {

        //it's horizontal

        //find max and min of x-vals

        int xcor = hitsList.get(0)[1];

        int max = -1;

        int min = 11;

        for (int i = 0; i < hitsList.size(); i++) {

          if (hitsList.get(i)[0] > max) {

            max = hitsList.get(i)[0];
          }

          if (hitsList.get(i)[0] < min) {

            min = hitsList.get(i)[0];
          }
        }

        /*
         fill(0,255,0);
         
         rect(0,400,150,40);
         
         String hitsL = "";
         
         for (int[] s : hitsList){
         
         hitsL += "{" + s[0] + "," + s[1] + "} ";
         
         }
         
         textFont(f,16);                  // STEP 3 Specify font to be used
         
         fill(0); 
         
         text(hitsL,10,420);
         
         fill(0,255,0);
         
         rect(0,120,80,40);
         
         textFont(f,16);                  // STEP 3 Specify font to be used
         
         fill(0);                         // STEP 4 Specify font color 
         
         text(min + " " + max + " " + " " + xcor, 20,140);
         
         */

        ArrayList<int[]> coords = new ArrayList<int[]>();

        if (min > 0 && min <= 9 && !userBoard.getSquare(min-1, xcor).isAttacked()) {

          int[] coor = {min - 1, xcor};

          coords.add(coor);
        }

        if (max < 9 && max >= 0 && !userBoard.getSquare(max + 1,xcor).isAttacked()) {

          int[] coor = {max + 1, xcor};

          coords.add(coor);
        }
/*
        
         fill(0,255,0);
         
         rect(0,300,150,40);
         
         String coor = "";
         
         for (int[] s : coords){
         
         coor += "{" + s[0] + "," + s[1] + "} ";
         
         }
         
         textFont(f,16);                  // STEP 3 Specify font to be used
         
         fill(0); 
         
         text(coor,10,330);
         */
         

        Random ran = new Random();

        int rand = ran.nextInt(coords.size());

        if (userBoard.attack(coords.get(rand)[0], xcor)) {

          userBoard.addAttacked();

          return true;
        }
      }
    } else {

      ArrayList<Integer> spots = new ArrayList<Integer>();

      //loop through all squares in user board

      for (int r=0; r<10; r++) {

        for (int c=0; c<10; c++) {

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



      if (userBoard.attack(r, c)) {

        userBoard.addAttacked();

        return true;
      }
    }

    return false;
  }

  public void displayTurns(int t, PFont f, int shipx, int shipy) {
    fill(0, 255, 0);
    rect(width/2-10, 0, 60, 20);
    rect(width/2-50, 20, 200, 20);
    rect(width/2-50, 40, 200, 40);

    textFont(f, 15);                  // STEP 3 Specify font to be used

    fill(0);                         // STEP 4 Specify font color 
    text(""+t, width/2, 15);   // STEP 5 Display Text
    text("ship: "+userBoard.shipClicked(), width/2, 30);
    text("mouse: "+mouseX+" "+mouseY, width/2, 50);
    text("ship: "+shipx+" "+shipy, width/2, 70);
  }

  public void rotateButton() {
    PImage rotate = loadImage("rotatebutton.png");
    image(rotate, 0, 0, 70, 70);
  }

  public void checkButton() {
    PImage check = loadImage("check.png");
    image(check, 0, 80, 70, 70);

    /*
    fill(0);                           // STEP 4 Specify font color 
     text(""+t,width/2,15);            // STEP 5 Display Text
     */
  }


  //returns 0 if game is not over, 1 if user wins, 2 if computer won
  public int isGameOver() {
    boolean compWon = true;
    boolean userWon = true;
    for (int i=0; i<userBoard.ships.length; i++) { //both arrays are same length
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
    background(0);
    rect(height/2-100, width/2-20, 200, 40);

    String t = "";
    if (whoWon == 1) t = "USER won!";
    if (whoWon == 2) t = "COMP won!";

    textFont(f, 16);                  // STEP 3 Specify font to be used
    fill(0,255,0);     // STEP 4 Specify font color 
    text(t, width/2, height/2);   // STEP 5 Display Text
    text("Thanks for playing!", width/2, height/2 + 30);
  }
}
