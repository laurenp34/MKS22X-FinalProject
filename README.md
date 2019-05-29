# MKS22X-FinalProject
Single player Battleship against the computer

<b>Saturday, May 18th</b>
<br>
Lauren:
* Created class structure based on UML
* Started constructors for each class
* Started creating gameBoard and displaying it to screen
<br>
Sophie:
* Made grid
* Worked on accessing ships from square class
* Started setting up ships

<b>Sunday, May 19th</b>
<br>

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
<br>
Lauren:
* Finished the add ship methods that work with varying size and direction of ships
* Made addShipsRandomly() method to add 6 ships randomly without overlap
* Expanded the method to space out ships even more

<b>Wednesday, May 22nd</b>
<br>
Sophie:
* made displayCompBoard() and displayUserBoard() (fixed)
* made compChooseSquare()
<br>
Lauren:
* Made attack() method in Square class
* Made userChooseSquare() method that attacks a square based on mouse click
* Updated setup() in Battleship class to increment turns once chooseSquare method returns true.

<b>Thursday, May 23rd</b>
<br>
Sophie:
* made turnOver() method
<br>
Lauren: 
* Kept testing because displayBoard doesn't work, spent period debugging.
* Couldn't figure out why displayBoard didn't work.
* Found that in setup() displayBoard works but not in draw

<b>Friday, May 24th</b>
<br>
Sophie:
<br>
Lauren: 
* Spent period trying to figure out why displayBoard didn't work again.

<b>Saturday, May 25th</b>
<br>
Sophie: 
<br>
Lauren: 

<b>Sunday, May 26th</b>
<br>
Sophie:
<br>
Lauren: 

<b>Monday, May 27th</b>
<br>
Sophie: 
<br>
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
<br>
Lauren: 
* In class, used frameRate to successfully pause between screens for the player to view the boards before switching- this replaced delay() which didn't work.
* Fixed compChooseSquare to add only available squares to array and choose from there, to only choose a valid square and eliminate the possibility of choosing forever.
* Removed unnecessary instance variables and methods in ship class.
* Updated Ship class to have an array of squares that it occupies, and updated constructor and code to initialize ships.
* Used this^ to create a new attack method that will make change ship to !alive and change the square below if the ship is completely attacked. 
* Added code in new attack method to attack adjacent squares after a square is completely attacked (eliminate the squares)
* Added a game over checker method that runs after turns in draw()
* Added another game over method that prints simple game over statement if game is over, and ends draw() loop.

