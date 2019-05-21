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
    Random ran = new Random();
    Ship c1 = new Ship(3, 0,0);
    userBoard.addShip(c1,0,0);
    System.out.println(userBoard.board[0][0].isShipHere());
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
