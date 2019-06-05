class GameBoard {
  Square[][] board;
  int rows;
  int cols;
  int squaresAttacked;
  Ship[] ships;
  int shipCount; //how many ships have been placed on the board
  int hits;

  public GameBoard() {
    squaresAttacked = 0;
    rows = 10; 
    cols = 10;
    hits = 0;
    shipCount =0;
    ships = new Ship[5]; //5 ships total
    board = new Square[10][10]; //10x10 board.
    for (int i=0; i<10; i++) {
      for (int i2=0; i2<10; i2++) {
        //initializes each square in the game board with the upper left hand corner coordinates. 
        //each square is size 70x70
        Square s = new Square(i*70+150, i2*70+50);
        board[i][i2] = s;
        s.setRC(i, i2);
      }
    }
  }

  public Square[][] getBoard() {
    return board;
  }

  //prints ocean picture resized correctly- to be covered up partially.
  public void printOcean() {
    PImage ocean = loadImage("ocean.png");
    image(ocean, board[0][0].getX(), board[0][0].getY(), 700, 700);
  }

  //prints 10x10 white grid to cover up ocean and ships.
  public void printGrid() {
    stroke(255);
    noFill();
    for (int x=0; x < 10; x++) {
      for (int y=0; y < 10; y++) {
        rect(board[x][y].getX(), board[x][y].getY(), 70, 70);
      }
    }
  }

  //prints ship images -- PRINTS ALL SHIPS
  public void printShips() {
    for (int i=0; i<ships.length; i++) {
      ships[i].display();
    }
  }


  //prints ship images - ONLY FOR DEAD SHIPS// displaying on comp board
  public void printShipsDead() {
    for (int i=0; i<ships.length; i++) {
      PImage p;
      if (!ships[i].alive) {
        if (ships[i].size == 3) {
          //get top-most, left-most x and y coordinates (use ship's square array)
          int x1 = ships[i].squares[0].getX();
          int y1 = ships[i].squares[0].getY();
          //horizontal ship
          if (ships[i].dir == 0) {
            p = loadImage("ship3dead.png");
            image(p, x1, y1, 210, 70);
          } else {
            p = loadImage("ship3updead.png");
            image(p, x1, y1, 70, 210);
          }
        }
      }
    }
  }

  //check to see if a ship (with no location yet) can be placed at row,col
  public boolean canAddShipHere(Ship newShip, int row, int col) {
    int size = newShip.getSize();
    int dir = newShip.getDir();

    //vertical ship
    if (dir==0) {
      for (int n=-1; n<=size; n++) {
        if (row>=0 && row < 10) {
          if (isShipHere(row+n, col)) return false;
          if (col>0 && isShipHere(row+n, col-1)) return false;
          if (col<9 && isShipHere(row+n, col+1)) return false;
        }
      }
      //horizontal ship
    } else {
      for (int n=-1; n<=size; n++) {
        if (col>=0 && col<10) {
          if (isShipHere(row, col+n)) return false;
          if (row>0 && isShipHere(row-1, col+n)) return false;
          if (row<9 && isShipHere(row+1, col+n)) return false;
        }
      }
    }
    return true;
  }

  //increment squaresAttacked
  public void addAttacked() {
    squaresAttacked++;
  }


  //adds a ship to the board, as well as to the ships array.
  public boolean addShip(Ship newShip, int row, int col) {
    int size = newShip.getSize();
    int dir = newShip.getDir();
    //int r1 = newShip.getR1();
    //int c1 = newShip.getC1();

    if (!canAddShipHere(newShip, row, col)) return false;

    //set location of ship to row,col
    newShip.setLocation(row, col);

    //vertical ship
    if (dir==0) {
      for (int n=0; n<size; n++) {
        Square s = board[row+n][col];
        s.addShipHere(newShip);
        newShip.addSquare(n, s);
      }
      //horizontal ship
    } else {
      for (int n=0; n<size; n++) {
        Square s = board[row][col+n];
        s.addShipHere(newShip); 
        newShip.addSquare(n, s);
      }
    }
    newShip.updateXY();
    ships[shipCount] = newShip;
    shipCount++;
    return true;
  }

  public boolean attack(int r, int c) {
    Square s = board[r][c];
    boolean out = s.attack();
    //if attack doens't work, return false immediately
    if (!out) return out;
    hits++;
    //if this attack made the ship fully attacked:
    if (s.hasShip && s.shipHere.attacks == s.shipHere.size) {
      //kill the ship
      s.shipHere.alive = false;
      //iterate through squares covered by ship and change fullyAttacked variable
      for (int i=0; i<s.shipHere.size; i++) {
        Square sq = s.shipHere.squares[i];
        sq.fullShipFound = true;
        //hits -= s.shipHere.size();

        //also ask adjacent squares to be attacked (eliminate)
        int row = sq.r;
        int col = sq.c;
        //first square in ship-- ask previous row/col outside ship to be attacked
        //only execute this part once
        if (i==0) {
          //vertical ship
          if (s.shipHere.dir == 0 && row > 0) {
            if (col > 0) board[row-1][col-1].attack();
            board[row-1][col].attack();
            if (col < 9) board[row-1][col+1].attack();
          }
          //horizontal ship
          if (s.shipHere.dir == 1 && col > 0) {
            if (row > 0) board[row-1][col-1].attack();
            board[row][col-1].attack();
            if (row < 9) board[row+1][col-1].attack();
          }
        } 

        if (s.shipHere.dir == 0) {
          if (col > 0) board[row][col-1].attack();
          board[row][col].attack();
          if (col < 9) board[row][col+1].attack();
        }
        //horizontal ship
        if (s.shipHere.dir == 1) {
          if (row > 0) board[row-1][col].attack();
          board[row][col].attack();
          if (row < 9) board[row+1][col].attack();
        }

        if (i+1 == s.shipHere.size) {
          //only execute this once:
          //now attack the row/column after the last row/column
          if (s.shipHere.dir == 0 && row < 9) {
            if (col > 0) board[row+1][col-1].attack();
            board[row+1][col].attack();
            if (col < 9) board[row+1][col+1].attack();
          }
          //horizontal ship
          if (s.shipHere.dir == 1 && col < 9) {
            if (row > 0) board[row-1][col+1].attack();
            board[row][col+1].attack();
            if (row < 9) board[row+1][col+1].attack();
          }
        }
      }
    }

    return true;
  }

  public void placeShipsRandomly() {
    for (int i=0; i<5; i++) { //loop runs 5 times
      Ship s;
      if (i < 1) {
        s = new Ship(5); //add 1 ship size 5
        //coordinates can be btn (0-5) b/c size 5
        int r = (int) (Math.random() * 6);
        int c = (int) (Math.random() * 6);
        while (!addShip(s, r, c)) {
          r = (int) (Math.random() * 6);
          c = (int) (Math.random() * 6);
        }
      } else if (i < 2) {
        s = new Ship(4); //add 1 ship size 4
        //coordinates can be btn (0-6) b/c size 4
        int r = (int) (Math.random() * 7);
        int c = (int) (Math.random() * 7);
        while (!addShip(s, r, c)) {
          r = (int) (Math.random() * 7);
          c = (int) (Math.random() * 7);
        }
      } else if (i < 4) {
        s = new Ship(3); //add 2 ships size 3
        //coordinates can be btn (0-7) b/c size 3
        int r = (int) (Math.random() * 8);
        int c = (int) (Math.random() * 8);
        while (!addShip(s, r, c)) {
          r = (int) (Math.random() * 8);
          c = (int) (Math.random() * 8);
        }
      } else {
        s = new Ship(2); //add 1 ship size 2
        //coordinates can be btn (0-8) b/c size 2
        int r = (int) (Math.random() * 9);
        int c = (int) (Math.random() * 9);
        while (!addShip(s, r, c)) {
          r = (int) (Math.random() * 9);
          c = (int) (Math.random() * 9);
        }
      }
    }
  }

  //puts ships on side, ready to be dragged by user
  public void setupShips() {
    //add ship size 5
    Ship a = new Ship(5);
    a.setXY(900, 50);
    ships[0] = a;

    //add ship size 4
    Ship b = new Ship(4);
    b.setXY(900, 450);
    ships[1] = b;

    //add 2 ships size 3
    Ship c = new Ship(3);
    c.setXY(1300, 50);
    ships[2] = c;

    Ship d = new Ship(3);
    d.setXY(1300, 310);
    ships[3] = d;

    //add ship size 2
    Ship e = new Ship(2);
    e.setXY(1300, 570);
    ships[4] = e;
  }

  /*
  public Square compStrategize(){
   for (int y = 0; y < board.length; y++){
   for (int x = 0; x < board[0].length; x++){
   if (board[y][x].isAttacked()){
   int xory = Math.random() * 2;
   int posorneg = Math.random() * 2;
   if (xory == 0){
   if (posorneg == 0){
   if (board[x-1][y] */

  public boolean isShipHere(int row, int col) {
    if (row > 9 || row < 0 || col < 0 || col > 9) return false;
    return board[row][col].isShipHere();
  }


  public int getHits() {
    return hits;
  }

  //returns an array: {index, xdist, ydist}
  //index: if no ship is clicked, return -1, else return the index of ships that the ship is
  //xdist: distance from mouse to x1 
  //ydist: distance from mouse to y1
  public float[] shipClicked() {
    float[] out = new float[3];
    if (mousePressed) {
      for (int i=0; i<ships.length; i++) {
        if ((ships[i].dir == 0 && mouseX - ships[i].x1 <= 70 && mouseY - ships[i].y1 <= (70 * ships[i].size)) || (ships[i].dir == 1 && mouseX - ships[i].x1 <= (70 * ships[i].size) && mouseY - ships[i].y1 <= 70)) {
          out [0] = i;
          out [1] = mouseX - ships[i].x1;
          out [2] = mouseY - ships[i].y1;
          return out;
        }
        /*
      //if clicking ship size 4
         if (ships[1].dir == 0 && mouseX >= 900 && mouseX <= 970 && mouseY >= 450 && mouseY <= 730) return 1;
         if (ships[1].dir == 1 && mouseX >= 900 && mouseX <= 1180 && mouseY >= 450 && mouseY <= 520) return 1;
         
         //if clicking 1st ship size 3
         if (ships[2].dir == 0 && mouseX >= 1300 && mouseX <= 1370 && mouseY >= 50 && mouseY <= 260) return 2;
         if (ships[2].dir == 1 && mouseX >= 1300 && mouseX <= 1510 && mouseY >= 50 && mouseY <= 120) return 2;
         
         //if clicking 2nd ship size 3
         if (ships[3].dir == 0 && mouseX >= 1300 && mouseX <= 1370 && mouseY >= 310 && mouseY <= 520) return 3;
         if (ships[3].dir == 1 && mouseX >= 1300 && mouseX <= 1510 && mouseY >= 310 && mouseY <= 380) return 3;
         
         //if clicking ship size 2
         if (ships[4].dir == 0 && mouseX >= 1300 && mouseX <= 1370 && mouseY >= 570 && mouseY <= 710) return 4;
         if (ships[4].dir == 1 && mouseX >= 1300 && mouseX <= 1440 && mouseY >= 570 && mouseY <= 640) return 4; */

      }
    }
    out[0] = -1;
    return out;
  }
  
  //user selects a square 
  //return whether or not the ship can be placed there
  public boolean selectSquare(Ship s){
    return true;
  }
  
  //input is the float[] returned from shipClicked^^
  //output is whether or not the ship was moved
  public boolean drag() {
    float[] clickInfo = shipClicked();
    if (clickInfo[0] == -1) return false;
    Ship ship = ships[(int) clickInfo[0]];
    float xdist = clickInfo[1];
    float ydist = clickInfo[2];
    System.out.println(xdist+" "+ydist);
      System.out.println(mousePressed);
      //System.out.println(mouseX+" "+mouseY);
      ship.setXY(mouseX-xdist, mouseY-ydist);
      System.out.println(mouseX+" "+mouseY+" "+(mouseX-xdist)+" "+(mouseY-ydist));
      //ship.x1 = mouseX - xdist;
      //System.out.println(ship.x1);
      //ship.y1 = mouseY - ydist;
      //System.out.println(ship.y1);
      //System.out.println(ship.x1+" "+ship.y1);
      ship.display();
      System.out.println("what");
    return true;
  }
}
