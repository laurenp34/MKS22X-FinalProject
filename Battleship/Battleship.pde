 
import java.util.Random;
Game g = new Game();
PFont f;

void setup() {
  size(1000,800);
  f = createFont("Arial",16,true);
  //Game g = new Game();
  g.setupShips();
  //System.out.println(g.compBoard.ships.length);
  g.compBoard.setupBoard();
  //g.displayCompBoard();
      
}

private int turns = 0;
private int prevTurns = 0;

void draw() {
  System.out.println(turns);
  //while (turns % 2 == 0){
    g.compBoard.setupBoard();
   g.displayCompBoard(f);
    //System.out.println(turns);
    //first turn: user choose square
    if (g.userChooseSquare()) {
      g.displayCompBoard(f);
      turns++;
      delay(6000);
    }
      //g.displayCompBoard();
      //delay(6000);
    //}
  
  System.out.println(turns);
  while (turns % 2 == 1) {
    //display user board.
    g.userBoard.setupBoard();
    g.displayBoard(f);
    if (g.compChooseSquare()) {
      turns++;
      g.displayBoard(f);
      delay(6000);
    }
  }
  
 // g.displayCompBoard(); 
  //g.displayBoard();

  
  /*while (turns == 0) {
     if (g.userChooseSquare()) turns++; 
  }*/
  // this hasn't been implemented yet
  /*
  if (g.turnOver(turns % 2)){
    turns ++;
    delay(200);
  }
  if (turns % 2 == 0){
    g.displayBoard();
    if (prevTurns != turns){
      if (g.userChooseSquare()) turns++;
      prevTurns = turns;
    }
  }
  else{*/
    //g.displayCompBoard();
    //g.userChooseSquare();
    // System.out.println(g.compBoard.squaresAttacked);
    //if (prevTurns != turns){
      //g.compChooseSquare();
      //prevTurns = turns;
    //}
  //}
      //prevTurns = turns;
    //}
   // }
}
