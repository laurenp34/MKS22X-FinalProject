class Game {
  GameBoard compBoard;
  GameBoard vCompBoard;
  GameBoard userBoard;
  int turns;
  
  public Game(){
   turns = 0; 
   compBoard = new GameBoard();
   vCompBoard = new GameBoard();
   userBoard = new GameBoard();
  }
  public void setupShips(){
    
    Ship c1 = new Ship(3, (int) (Math.random() * 8), (int) (Math.random() * 8));
    Ship c2 = new Ship(3, (int) (Math.random() * 8), (int) (Math.random() * 8));
    Ship c3 = new Ship(3, (int) (Math.random() * 8), (int) (Math.random() * 8));
    Ship c4 = new Ship(3, (int) (Math.random() * 8), (int) (Math.random() * 8));
    Ship c5 = new Ship(3, (int) (Math.random() * 8), (int) (Math.random() * 8));
    userBoard.addShip(c1);
    userBoard.addShip(c2);
    userBoard.addShip(c3);
    userBoard.addShip(c4);
    userBoard.addShip(c5);
    //Ship c2 = new Ship(3, 150 + ran.nextInt() % 600, 50 + ran.nextInt() % 600);
    //Ship c3 = new Ship(3, 150 + ran.nextInt() % 600, 50 + ran.nextInt() % 600);
    //Ship p1 = new Ship(3, 150 + ran.nextInt() % 600, 50 + ran.nextInt() % 600);
    //Ship p2 = new Ship(3, 150 + ran.nextInt() % 600, 50 + ran.nextInt() % 600);
    //Ship p3 = new Ship(3, 150 + ran.nextInt() % 600, 50 + ran.nextInt() % 600);
  } 
  
  public void displayBoard(){
    for (int r = 0; r < 10; r++) {
      for (int c = 0; c < 10; c++) {
        userBoard.getBoard()[r][c].displaySquare();
      }
   }
  }
}
