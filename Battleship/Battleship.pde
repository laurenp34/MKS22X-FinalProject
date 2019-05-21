import java.util.Random;


void setup() {
  size(1000,800);
  
  Game g = new Game();
  g.userBoard.setupBoard();
  g.setupShips();
  g.displayBoard();
}
void draw() {
  int turns = 0;
   Game g = new Game();
  if (turns % 2 == 0){
    g.displayBoard();
  }
  else{
    g.displayCompBoard();
  }
  // this hasn't been implemented yet
  if (g.turnOver()){
    turns ++;
  }
}