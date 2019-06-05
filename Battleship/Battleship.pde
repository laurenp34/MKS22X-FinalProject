
import java.util.Random;
PFont f;
Game g = new Game();

void setup() {
  size(1600, 800);

  f = createFont("Arial", 16, true);
  g.userBoard.setupShips();
  g.displayBoard(f);
  //g.displayBoard(f);
  //g.userBoard.printShips();
  g.displayTurns(0, f, 0, 0);
  //g.displayBoard(f);
  boolean found = false;

  // while (!found) {
  // while (mousePressed) {
  //float[] d = g.userBoard.shipClicked();
  //for (int i=0; i<d.length; i++) System.out.println(d[i]);
  //if (d[0] != -1) {
  //g.displayTurns(0, f, (int)g.userBoard.ships[(int)d[0]].x1, (int)g.userBoard.ships[(int)d[0]].y1);
  //System.out.println(true);
  //g.userBoard.drag(d);
  //found = true;
  //g.displayTurns(0, f, (int)g.userBoard.ships[(int)d[0]].x1, (int)g.userBoard.ships[(int)d[0]].y1);
  //}
  // }
  //}
}

private int turns = 0;
int c = 0;

void draw() {
  //System.out.println(mousePressed);
  if (g.setup) {
    g.displayBoard(f);
    if (g.userBoard.drag()) {
      g.setup = false;
      g.compBoard.placeShipsRandomly();
      g.displayCompBoard(f);
    }
  } else {
    g.displayCompBoard(f);
    //g.displayTurns(turns, f);
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
      if (frameCount-c == 50) {
        //if for some reason a square isn't attacked, don't increment framecount (keep trying)
        //if (!g.compChoose()) c++;
        g.compChoose();
      }
      if (frameCount-c > 70) {
        turns++;
      }
    }
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
  //}
  //System.out.println(mousePressed);
  //g.userBoard.drag();



/*
void draw() {
 while (mousePressed) {
 float[] d = g.userBoard.shipClicked();
 for (int i=0;i<d.length;i++) System.out.println(d[i]);
 if (d[0] != -1) {
 g.displayTurns(0, f, (int)g.userBoard.ships[(int)d[0]].x1, (int)g.userBoard.ships[(int)d[0]].y1);
 System.out.println(true);
 g.userBoard.drag(d);
 g.displayTurns(0, f, (int)g.userBoard.ships[(int)d[0]].x1, (int)g.userBoard.ships[(int)d[0]].y1);
 }
 
 
 //System.out.println(g.userBoard.ships[(int) d[0]].x1);
 }
 g.displayBoard(f);
 }*/


/*
void draw() {
 
 // }*/
