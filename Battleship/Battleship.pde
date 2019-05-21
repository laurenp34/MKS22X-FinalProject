import java.util.Random;

class Ship {
  int size;
  int x1;
  int y1;
  int x2;
  int y2;
  int dir; //vertical is 0, horizontal is 1. 
  boolean alive;
  boolean placed;
  
  public Ship(int newSize, int xcor, int ycor){ 
    size = newSize; 
    dir = (int) (Math.random() * 2); // choose 1 or 0 randomly.
    //for first part of development, ship's xy are chosen randomly too
    
  }
  
  public void show() {
    
  }
  
}
class Square {
  int x1; //x1 and y1 represent the upper left coordinates of the square
  int y1;
  boolean hasShip;
  boolean attacked;
  Ship shipHere;
  
  public Square(int x, int y) {
    x1 = x;
    y1 = y;
    attacked = false;
    hasShip = false;
  }
  
  public boolean isShipHere(){
    return hasShip;
  }
  
  public int getX() {
    return x1;
  }
  public int getY() {
    return y1;
  }
  
  public void addShipHere(Ship newShip){
    shipHere = newShip;
    attacked = false;
    hasShip = true;
  }
  
  public void displaySquare() {
   if (hasShip) {
    fill(255,0,0);
    rect(x1,y1,70,70);
   }
  }
  
}

class GameBoard {
  Square[][] board;
  int rows;
  int cols;
  Ship[] ships;
  
  public GameBoard(){
    rows = 10; 
    cols = 10;
    board = new Square[10][10];
    for (int i=0;i<10;i++) {
      for (int i2=0;i2<10;i2++) {
        board[i][i2] = new Square(i*70+150,i2*70+50);
      }
    }
  }
  
  public void showBoard() {
    stroke(255);
    fill(0);
    for (int x=0; x < 10; x++) {
      for (int y=0; y < 10; y++) {
         rect(board[x][y].getX(),board[x][y].getY(), 70,70);
      }
    }
  }
  
  public void addShip(Ship newShip, int row, int col){
    board[row][col].addShipHere(newShip);
  }
  
  public boolean isShipHere(int row, int col){
    return board[row][col].isShipHere();
  }
}

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
    Ship c1 = new Ship(3, 150, 50);
    userBoard.addShip(c1,0,0);
    System.out.println(userBoard.board[0][0].isShipHere());
    //Ship c2 = new Ship(3, 150 + ran.nextInt() % 600, 50 + ran.nextInt() % 600);
    //Ship c3 = new Ship(3, 150 + ran.nextInt() % 600, 50 + ran.nextInt() % 600);
    //Ship p1 = new Ship(3, 150 + ran.nextInt() % 600, 50 + ran.nextInt() % 600);
    //Ship p2 = new Ship(3, 150 + ran.nextInt() % 600, 50 + ran.nextInt() % 600);
    //Ship p3 = new Ship(3, 150 + ran.nextInt() % 600, 50 + ran.nextInt() % 600);
  } 
  
  public void fillShips(){
    for (int x = 0; x < 10; x++) {
      for (int y = 0; y < 10; y++) {
        if (userBoard.isShipHere(x, y)){
          userBoard.board[x][y].displaySquare();
       }
      }
   }
  }
}

void setup() {
  size(1000,800);
  GameBoard b = new GameBoard();
  b.showBoard();
}
void draw() {
  Game g = new Game();
  g.setupShips();
  g.fillShips();
}
