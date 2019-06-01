
import java.util.Random;
Game g = new Game();
PFont f;

void setup() {
  size(1600, 800);
  f = createFont("Arial", 16, true);
  g.compBoard.setupShips();
  g.displayCompBoard(f);
  g.compBoard.printShips();
}

private int turns = 0;
int c = 0;
/*
void draw() {
  g.displayTurns(turns, f);
  int gmo = g.isGameOver();
  if (gmo != 0) {
    g.gameOver(gmo, f);
    noLoop();
  }

  if (turns % 2 == 0) {
    g.displayCompBoard(f);
    if (g.userChooseSquare()) {
      turns++;
      c = frameCount;
      g.displayCompBoard(f);

       gmo = g.isGameOver();
      if (gmo != 0) {
        g.gameOver(gmo, f);
        noLoop();
      }
    }
  } else {
    if (frameCount-c > 30) {
      g.displayBoard(f);
    }
    if (frameCount-c == 35) {
      //if for some reason a square isn't attacked, don't increment framecount (keep trying)
      //if (!g.compChoose()) c++;
      g.compChoose();
    }
    if (frameCount-c > 40) {
      turns++;
    }
  }
  /*if (turns%2 == 0) {
   g.displayCompBoard(f);
   //first turn: user choose square
   while (turns%2 == 0) {
   if (g.userChooseSquare()) {
   g.displayCompBoard(f);
   turns++;
   g.displayTurns(turns, f);
   //delay(1000);
   }
   }
   } else {
   while (turns % 2 == 1) {
   //display user board.
   g.displayBoard(f);
   if (g.compChooseSquare()) {
   turns++;
   g.displayTurns(turns, f);
   g.displayBoard(f);
   //delay(1000);
   }
   }
   }
   delay(1000);
   
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
