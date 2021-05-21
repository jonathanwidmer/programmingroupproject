/**
  The Instructions page displays instructions on how to play the game.
*/

class Instructions{
  // declare global variables
  PImage background; // image of background
  
  /**
    Constructor
  */
  Instructions() {
    // initialize background
    background = loadImage("Instructions.png");
  }
  
  /**
    Displays the Instructions page
  */
  void display() {
    // display the instructions page
    background(background);
  }
}
