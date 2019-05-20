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
  int xcor;
  int ycor;
  boolean hasShip;
  boolean attacked;
  Ship shipHere;
  
  public Square(int x, int y) {
    xcor = x;
    ycor = y;
    attacked = false;
    hasShip = false;
  }
  
  public boolean isShipHere(){
    return hasShip;
  }
  
  public void addShipHere(Ship newShip){
    shipHere = newShip;
    attacked = false;
    hasShip = true;
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

      }
      
    }
  }
  
  public void showBoard() {
<<<<<<< HEAD
    fill(0,0,0);
    rectMode(RADIUS);
    rect(width/2, height/2, 300,300);
=======
    stroke(255);
    fill(0);
    for (int x=0; x < 10; x++) {
      for (int y=0; y < 10; y++) {
         square(x*70 + 150, y*70 + 50, 70);
      }
    }
  }
  
  public void addShip(Ship newShip, int row, int col){
    board[row][col].addShipHere(newShip);
  }
  
  public boolean isShipHere(int row, int col){
    return board[row][col].isShipHere();
>>>>>>> 9bbdba13ade3f47a054a97c7e11fde6768722fdf
  }
}

class Game {
  GameBoard compBoard;
  GameBoard vCompBoard;
  GameBoard userBoard;
  int turns;
  
  public Game(){
   turns = 0; 
   compBoard = new GameBoard(10, 10);
   vCompBoard = new GameBoard(10, 10);
   userBoard = new GameBoard (10, 10);
  }
  public void setupShips(){
    Random ran = new Random();
    Ship c1 = new Ship(3, 150 + ran.nextInt() % 600, 50 + ran.nextInt() % 600);
    Ship c2 = new Ship(3, 150 + ran.nextInt() % 600, 50 + ran.nextInt() % 600);
    Ship c3 = new Ship(3, 150 + ran.nextInt() % 600, 50 + ran.nextInt() % 600);
    Ship p1 = new Ship(3, 150 + ran.nextInt() % 600, 50 + ran.nextInt() % 600);
    Ship p2 = new Ship(3, 150 + ran.nextInt() % 600, 50 + ran.nextInt() % 600);
    Ship p3 = new Ship(3, 150 + ran.nextInt() % 600, 50 + ran.nextInt() % 600);
  } 
  
  public void fillShips(){
    for (int x = 0; x < 10; x++) {
      for (int y = 0; y < 10; y++) {
        if (userBoard.isShipHere(x, y)){
          fill(150);
          square(x*70 + 150, y*70 + 50, 70);
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
  g.fillShips();
}
