# MKS22X-FinalProject
Single player Battleship against the computer, where the computer has a strategy.
<b>Instructions:</b> First, the user drags their ships to the board. None of the ships can be off the board or directly adjacent. The user can also rotate the ships. Then, the user confirms and the screen switches to the computer's board (the computer's ships are placed randomly), displaying the squares that the user has attacked so far. The user selects squares and the screen toggles from user to computer's board. The game is over when either the computer or the user has sunken all of their opponent's ships.

<b>Saturday, May 18th</b>
<br>
Lauren:
* Created class structure based on UML
* Started constructors for each class
* Started creating gameBoard and displaying it to screen

Sophie:
* Made grid of squares in graphics
* Added a lot of accessors to be able to access ships from other classes (especially square and gameBoard)
* Started setting up ships

<b>Monday, May 20th</b>
<br>
Lauren:
* Added accessor methods across classes
* Worked on updating square objects based on grid coordinates
* Started code for adding ships: canAddShipHere() and addShipHere() based on direction and size
* Added simple method for displaying ships

<b>Tuesday, May 21st</b>
<br>
Sophie:
* Worked on toggling between the two boards
* Looked up ways to tell the board when to change and started turnOver() method to tell the board to switch its display

Lauren:
* Finished the add ship methods that work with varying size and direction of ships
* Made addShipsRandomly() method to add 6 ships randomly without overlap
* Expanded the method to space out ships even more

<b>Wednesday, May 22nd</b>
<br>
Sophie:
* fixed the display method so that it displays the computer board and the user board differently depending on what the user should be able to see, troubleshooted
* made compChooseSquare(), which for now has the computer just randomly choose a square that is not already attacked, but will expand

Lauren:
* Made attack() method in Square class
* Made userChooseSquare() method that attacks a square based on mouse click
* Updated setup() in Battleship class to increment turns once chooseSquare method returns true.

<b>Thursday, May 23rd</b>
<br>
Sophie:
* completed method turnOver() which should tell when the user or computer are done with their turn so that we can switch the board y comparing the old board to the new board

Lauren:
* Kept testing because displayBoard doesn't work, spent period debugging.
* Couldn't figure out why displayBoard didn't work.
* Found that in setup() displayBoard works but not in draw

<b>Friday, May 24th</b>
<br>
Sophie:
* experimented with delay() as a way to change between the boards, but it works weirdly so I tried to look up other ways

Lauren:
* Spent period trying to figure out why displayBoard didn't work again.

b>Sunday, May 26th</b>
<br>
Sophie:
* fixed a problem in CompChooseSquare() where it was attacking the wrong square and returning the wrong boolean

<b>Monday, May 27th</b>
<br>
Sophie:

Lauren:
* Spent a long time debugging again to figure out why displayBoard didn't work in draw().
* Finally figured out the error- redundant Game declaration that overwrote the one in setup.
* Fixed error with displayBoard, then added a part to displayBoard to print the title of the board on top
* Started loop code in draw() for turns
* Experimented with delay() function to pause screens for viewing
* Fixed error in compChooseSquare logic

<b>Tuesday, May 28th</b>
<br>
Sophie:
* make method for computer to choose the square

Lauren:
* In class, used frameRate to successfully pause between screens for the player to view the boards before switching- this replaced delay() which didn't work.
* Fixed compChooseSquare to add only available squares to array and choose from there, to only choose a valid square and eliminate the possibility of choosing forever.
* Removed unnecessary instance variables and methods in ship class.
* Updated Ship class to have an array of squares that it occupies, and updated constructor and code to initialize ships.
* Used this^ to create a new attack method that will make change ship to !alive and change the square below if the ship is completely attacked.
* Added code in new attack method to attack adjacent squares after a square is completely attacked (eliminate the squares)
* Added a game over checker method that runs after turns in draw()
* Added another game over method that prints simple game over statement if game is over, and ends draw() loop.

<b>Wednesday, May 29th</b>
<br>
Sophie:
* started the computer strategy so that if the computer finds a hit on the board, instead of choosing randomly it will randomly choose one of the squares around it to attack. I started tracking the hits and updating them whenever attack() is called

Lauren:
* Imported photos of ocean and ship, edited to fit the right size. 
* Added print methods to display these pictures on screen for the board.
* Tested rotate to print ships of both directions- didn't work.
* Updated display methods for user and comp to print dead or alive ships.

<b>Thursday, May 30th</b>
<br>
Sophie:
* I made a lastHit variable in the Game class and accessors to use in the computer strategy so that I won't have to loop to find hits.
* I redid the computer strategy so that the computer will add all adjacent squares that are in bounds and not already attacked and then choose randomly from those squares which one to attack
* tried printing things onto the board to figure out why getHits() / the hits variable isn't updating properly
* integrated the code for computer choosing square, fixed a problem because part of the code wasn't being called

Lauren:
* Edited methods to place ships to extend to ships of all sizes 
* Found and edited pictures of ships of all sizes 
* Updated numbers of diff sized ships according to real game rules, it worked to place ships randomly.
* Updated display methods to print different sized ships.

<b>Friday, May 31th</b>
<br>
Both:
* debugged compChooseSquare. We figured out why getHits() wasn't working and changed code in the attack() method to fix it
* tried to figure out why the computer stops attacking after it gets 2 hits sometimes by printing relevant information onto the board.

<b>Saturday, June 1st</b>
<br>
Sophie:
* fixed getHits() in attack again so its doesn't become negative after a whole ship is found and the methid also attacks all of the surrounding ships

Lauren:
* Began settup up the board for drag- widened board and figured out coordinates for ships to placed there without touching.
* Created setupShips method that places ships on the side before they are placed.
* Moved display method to ship class, for abstraction. 
* Began code to return which ship is being clicked based on coordinates.

<b>Sunday, June 2nd</b>
<br>
Sophie:
* Added to computer strategy so that if there is more than one hit in a row, the computer will only choose the adjacent squares in the row or column of the ship's direction. Essentially, now there are only two possibilities if there are already two hits in a row.

Lauren:
* Spent a long time debugging ShipClicked, because direction didn't work. Finally got it to work. 
* Converted hardcoded part of shipClicked to a generalized statement.



<b>Monday, June 3rd</b>
<br>
Sophie:
* Debugged computer strategy for a long time by printing relevant variables to the board. I found out that when the computer randomly chooses a coordinate, it always chooses 0, so I changed the random I was using from Math.random() to Random() and that worked for some reason. Now it sometimes returns an index out of bounds error, so I think there is a problem with the coordinates
* Fixed the comp strategy with 2 hits so that it makes an array of possible coordinates and chooses randomly from those in case the first coordinate it chooses fails

Lauren:
* Made a drag method that had a loop for mousePressed and moves ship based on shipClicked.
* Spent a long time debugging again because mousePressed only updates every frame, but I had a loop within draw.
* Basically spent the whole day debugging :(

<b>Tuesday, June 4th</b>
<br>
Sophie:
* I was trying to fix 2 problems with the computer strategy for so long! I printed out all of the variables and arrays that the method used onto the screen to try to figure out why the method didn't always print out the right coordinates. It turned out to me that one of the variables in another class wasn't properly updated and that part of the method wasn't looking at the right square when it checked if the surrounding squares were attacked

Lauren:
* Finally figured out how to drag ships without a loop in draw - used instance variables and conditionals.
* Also created a placeShip method that snaps the ship to the right squares
* Debugged direction for finding the right square- had to edit canAddShipHere method 
* drag and placeShip methods work when mouse is clicked!
* Added a rotate button, to rotate selected ship. Imported image
* Edited photos of each ship to be selected, then edited shipClicked method to differentiate between drag and selected.
* Incorporated rotate into selected ship, after drag is done you can rotate selected ship.
* Added done button to start playing after all ships are placed.
* Add setIMg method for ships so that image doesn't have to be loaded each time- saves time.
* Fixed all display methods 
* Re-incorporated turns and game over into the draw loop.
