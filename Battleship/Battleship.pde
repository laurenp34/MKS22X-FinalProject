import java.util.Random;
Game g = new Game();

void setup() {
  size(1000,800);
  
  //Game g = new Game();
  g.userBoard.setupBoard();
  g.setupShips();
  g.displayBoard();
}

private int turns = 0;
private int prevTurns = 0;

void draw() {
  //int turns = 0;
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
      g.compChooseSquare();
      prevTurns = turns;
    }
  }
  // this hasn't been implemented yet
  if (g.turnOver()){
    turns ++;
  }
}