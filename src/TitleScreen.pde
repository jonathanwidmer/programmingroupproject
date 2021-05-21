/**
  The TitleScreen class is displayed before the user begins playing the game.
*/

class TitleScreen {
  PImage background; // background image
  boolean play = false; // the user has not begun playing yet
  boolean instructions = false;

  // constructor
  TitleScreen() {
    // initialize the images
    background = loadImage("TitleScreen.pnTitg");
  }
  
  /**
    Display the title screen
  */
  void display() {
    // display the background image
    background(background);
    
    // if the user presses on the start button, start the game
    if(mousePressed && mouseX>500 && mouseX<770 && mouseY>390 && mouseY<550) {
      play = true;
    }
  }
}
  
