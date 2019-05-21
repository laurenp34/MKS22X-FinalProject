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
  
  //check to see if a ship (with no location yet) can be placed at row,col
   public boolean canAddShipHere(Ship newShip, int row, int col) {
    int size = newShip.getSize();
    int dir = newShip.getDir();
    
    //check 3 squares a
    
     //vertical ship
    if (dir==0) {
      for (int n=-1;n<=size;n++) {
        if (row>=0 && row < 10) {
          if (isShipHere(row+n,col)) return false;
          if (col>0 && isShipHere(row+n,col-1)) return false;
          if (col<9 && isShipHere(row+n,col+1)) return false;
        }
      }
    //horizontal ship
    } else {
      for (int n=-1;n<=size;n++) {
        if (col>=0 && col<10) {
         if (isShipHere(row,col+n)) return false;
         if (row>0 && isShipHere(row-1,col+n)) return false;
         if (row<9 && isShipHere(row+1,col+n)) return false;
        }
      }
    }
    return true;
   }
  
  
  //adds a ship to the board, as well as to the ships array.
  public boolean addShip(Ship newShip, int row, int col){
    int size = newShip.getSize();
    int dir = newShip.getDir();
    //int r1 = newShip.getR1();
    //int c1 = newShip.getC1();
    
    if (!canAddShipHere(newShip,row,col)) return false;
    
    //set location of ship to row,col
    newShip.setLocation(row,col);
    
     //vertical ship
    if (dir==0) {
      for (int n=0;n<size;n++) {
        board[row+n][col].addShipHere(newShip);
      }
    //horizontal ship
    } else {
      for (int n=0;n<size;n++) {
         board[row][col+n].addShipHere(newShip); 
      }
    }
    ships[shipCount] = newShip;
    shipCount++;
    return true;
  }
  
  public void placeShipsRandomly() {
   for (int i=0;i<6;i++) { //loop runs 6 times
   //for now, only place ships size 3 (coordinates can be btn. 0-7)
     int r = (int) (Math.random() * 8);
     int c = (int) (Math.random() * 8);
     Ship s = new Ship(3);
     while (!addShip(s,r,c)) {
       r = (int) (Math.random() * 8);
       c = (int) (Math.random() * 8); 
     }
   }
  }
  
  
  public boolean isShipHere(int row, int col){
    return board[row][col].isShipHere();
  }
}