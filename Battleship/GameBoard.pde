class GameBoard {
  Square[][] board;
  int rows;
  int cols;
  Ship[] ships;
  int shipCount; //how many ships have been placed on the board
  
  public GameBoard(){
    rows = 10; 
    cols = 10;
    shipCount =0;
    ships = new Ship[6]; //6 ships total
    board = new Square[10][10]; //10x10 board.
    for (int i=0;i<10;i++) {
      for (int i2=0;i2<10;i2++) {
        //initializes each square in the game board with the upper left hand corner coordinates. 
        //each square is size 70x70
        board[i][i2] = new Square(i*70+150,i2*70+50);
      }
    }
  }
  
  public Square[][] getBoard() {
    return board;
  }
  
  //prints board for the first time.
  //creates a 10x10 grid with all black squares (no ships yet).
  public void setupBoard() {
    stroke(255);
    fill(0);
    for (int x=0; x < 10; x++) {
      for (int y=0; y < 10; y++) {
         rect(board[x][y].getX(),board[x][y].getY(), 70,70);
      }
    }
  }
  
  //adds a ship to the board, as well as to the ships array.
  public void addShip(Ship newShip){
    int size = newShip.getSize();
    int dir = newShip.getDir();
    int r1 = newShip.getR1();
    int c1 = newShip.getC1();
    
     //vertical ship
    if (dir==0) {
      for (int n=0;n<size;n++) {
        board[r1+n][c1].addShipHere(newShip);
      }
    //horizontal ship
    } else {
      for (int n=0;n<size;n++) {
         board[r1][c1+n].addShipHere(newShip); 
      }
    }
    ships[shipCount] = newShip;
    shipCount++;
  }
  
  public boolean isShipHere(int row, int col){
    return board[row][col].isShipHere();
  }
}
