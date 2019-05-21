import java.util.Random;


void setup() {
  size(1000,800);
  GameBoard b = new GameBoard();
  b.setupBoard();
}
void draw() {
  Game g = new Game();
  g.setupShips();
  g.displayBoard();
}
