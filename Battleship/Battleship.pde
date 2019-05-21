import java.util.Random;


void setup() {
  size(1000,800);
  
  Game g = new Game();
  g.userBoard.setupBoard();
  g.setupShips();
  g.displayBoard();
}
void draw() {

}