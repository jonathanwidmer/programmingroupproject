// declare global variables
Player p1;
StartScreen startScreen;
TitleScreen titleScreen;
Timeline timeline;
Resources resources;
Instructions instructions;
World world;

/**
  Initialize pages, player, and screen
*/
public void settings() {
  // set size of the frame
  size(1280, 720);
  // initialize player
  p1 = new Player(310, 170);
  
  // initialize the start screen, title screen, timeline page, resources page, and world
  startScreen = new StartScreen();
  titleScreen = new TitleScreen();
  timeline = new Timeline();
  resources = new Resources();
  instructions = new Instructions();
  world = new World(p1);
}

/**
  Draws the pages and game on the screen
*/
void draw() {
  // if the user presses the Play button
  if (startScreen.startGame) {
    
    // draw the titleScreen
    if(titleScreen.play) { 
      // if the user presses the Start button to start playing the game
      world.restartGame = false;
      if(!world.endGame) {
        // if the user does not want to end the game, display the game
        world.display();
        
      } 
      if(world.restartGame) {
        // if the user wants to restart the game, go back to the title screen
        titleScreen.play = false;
        titleScreen.display();
        
      } else if (world.endGame) {
        // otherwise, if the user wants to end the game, display the end game screen
        background(0);
        imageMode(CORNER);
        image(world.thankYouImage, 0, 0);
        
      } 
    } else { //<>//
      // display the title screen
      titleScreen.display();
      
      // display which level the user is on
      textSize(50);
      fill(0);
      textAlign(CENTER);
      text("Level " + world.curLevel, width/2, 350);
      
      // if user presses a button
      if(mousePressed) {
        if(mouseX>1205 && mouseX<1265 && mouseY>15 && mouseY<65) {
          // if the user presses the back button, go back to the start screen
          startScreen.startGame = false;
          startScreen.display();
        }
      }
      
    }
  } else if (startScreen.viewTimeline) { // if the user presses the Timeline button
  
    // display the timeline
    timeline.display();
    
    // if the user presses the back button, go back to the start screen
    if(mousePressed && mouseX>1205 && mouseX<1265 && mouseY>15 && mouseY<65) {
      startScreen.viewTimeline = false;
      startScreen.display();
    }
  } else if (startScreen.viewResources) { // if the user presses the Resources button
    
    // display the resources page
    resources.display();
    
    // if the user presses the back button, go back to the start screen
    if(mousePressed && mouseX>1205 && mouseX<1265 && mouseY>15 && mouseY<65) {
      startScreen.viewResources = false;
      startScreen.display();
    }
  } else if (startScreen.viewInstructions) { // if the user presses the Instructions button
    
    // display the instructions page
    instructions.display();
    
    // if the user presses the back button, go back to the start screen
    if(mousePressed && mouseX>1205 && mouseX<1265 && mouseY>15 && mouseY<65) {
      startScreen.viewInstructions = false;
      startScreen.display();
    }
  } else {
    // otherwise, if the user does not do any actions, display the start screen
    startScreen.display();
  }
}
