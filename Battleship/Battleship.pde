import java.util.Random;
Game g = new Game();

void setup() {
  size(1000,800);
  Game g = new Game();
  g.setupShips();
  g.compBoard.setupBoard();
  //g.displayBoard();
}

private int turns = 0;
private int prevTurns = 0;

void draw() {
  
  /*while (turns == 0) {
     if (g.userChooseSquare()) turns++; 
  }*/
  // this hasn't been implemented yet
  /*
  if (g.turnOver(turns % 2)){
    turns ++;
  }
  if (turns % 2 == 0){
    g.displayBoard();
    if (prevTurns != turns){
      if (g.userChooseSquare()) turns++;
      prevTurns = turns;
    }
  }
  else{*/
    g.displayCompBoard();
    g.userChooseSquare();
    System.out.println(g.compBoard.squaresAttacked);
    //if (prevTurns != turns){
      //g.compChooseSquare();
      //prevTurns = turns;
    //}
  //}
}