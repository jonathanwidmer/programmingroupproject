/**
  The Timeline page displays a timeline with more information about the dinosaurs.
*/

class Timeline{
  // declare global variables
  PImage background; // image of timeline
  
  /**
    Constructor
  */
  Timeline() {
    // initialize timeline
    background = loadImage("Timeline.png");
  }
  
  /**
    Displays the Timeline page
  */
  void display() {
    // display the timeline
    background(background);
  }
}
