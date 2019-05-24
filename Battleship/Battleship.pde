import java.util.Random;
Game g = new Game();

void setup() {
  size(1000,800);
  Game g = new Game();
  g.setupShips();
  g.compBoard.setupBoard();
  g.displayCompBoard();
}

private int turns = 0;
private int prevTurns = 0;

void draw() {
  
  /*while (turns == 0) {
     if (g.userChooseSquare()) turns++; 
  }*/
  // this hasn't been implemented yet
  if (g.turnOver(turns % 2)){
    turns ++;
    delay(200);
  }
  if (turns % 2 == 0){
    g.displayBoard();
    if (prevTurns != turns){
      g.userChooseSquare();
      prevTurns = turns;
    }
  }
  else{
    g.displayCompBoard();
    if (prevTurns != turns){
      //g.compChooseSquare();
      prevTurns = turns;
    }
  }
}