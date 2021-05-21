/**
  The StartScreen class is the main menu that is first 
  displayed when the user opens the application.
*/

class StartScreen {
  
  // declare global variables
  boolean startGame = false; // if user pressed play button
  boolean viewResources = false; // if user pressed resources button
  boolean viewTimeline = false; // if user pressed timeline button
  boolean viewInstructions = false;
  PImage startImage; // image of main menu
  /**
    Constructor
  */
  StartScreen(){
    // initialize image of main menu
    startImage = loadImage("StartScreen.png");
  }
  
  /**
    Displays the Start Screen
  */
  void display() {
    
    // display the start screen image
    background(startImage);
    
    // if the user presses the mouse
    if (mousePressed) {
      if(mouseX>80 && mouseX<310 && mouseY>80 && mouseY <210) {
          // if user presses on the Play button, then set startGame to true
          startGame= true;
          viewTimeline = false;
          viewResources = false;
          viewInstructions = false;
      } else if(mouseX>80 && mouseX<310 && mouseY>280 && mouseY<410) {
          // if user presses on the Play button, then set viewTimeline to true
          viewTimeline = true;
          startGame = false;
          viewResources = false;
          viewInstructions = false;
      } else if(mouseX>80 && mouseX<310 && mouseY>480 && mouseY<610) {
          // if user presses on the Play button, then set viewResources to true
          viewResources = true;
          viewTimeline = false;
          startGame = false;
          viewInstructions = false;
      } else if(mouseX>width/2-150 && mouseX<width/2+150 && mouseY>505 && mouseY<620) {
          // if user presses on the Instructions button, then set viewInstructions to true
          viewInstructions = true;
          viewResources = false;
          viewTimeline = false;
          startGame = false;
      } 
    }
  }
}
