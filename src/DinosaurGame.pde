Player p1;

StartScreen startScreen;
TitleScreen titleScreen;
Timeline timeline;
Resources resources;
World world;

public void settings() {
  size(1280, 720);
  p1 = new Player(310, 170);
  
  startScreen = new StartScreen();
  titleScreen = new TitleScreen();
  timeline = new Timeline();
  resources = new Resources();
  world = new World(p1);
}

void draw() {
  // if the user wants to play the game
  if (startScreen.startGame) {
    // draw the titleScreen
    if(titleScreen.play) {
      world.restartGame = false;
      if(!world.endGame) {
        world.display();
      } 
      if(world.restartGame) {
        titleScreen.play = false;
        titleScreen.display();
      } else if (world.endGame) {
        background(0);
        imageMode(CORNER);
        image(world.thankYouImage, 0, 0);
      }
    } else {
      titleScreen.display();
      textSize(50);
      fill(255);
      text("Level " + world.curLevel, width/2, height/2-10);
      if(mousePressed && mouseX>1215 && mouseX<1270 && mouseY>15 && mouseY<65) {
        startScreen.startGame = false;
        startScreen.display();
      }
    } //<>//
  } else if (startScreen.viewTimeline) {
    // if the user wants to view the timeline
    timeline.display();
    if(mousePressed && mouseX>1215 && mouseX<1270 && mouseY>15 && mouseY<65) {
      startScreen.viewTimeline = false;
      startScreen.display();
    }
  } else if (startScreen.viewResources) {
    // if the user wants to view the resources
    resources.display();
    if(mousePressed && mouseX>1215 && mouseX<1270 && mouseY>15 && mouseY<65) {
      startScreen.viewResources = false;
      startScreen.display();
    }
  } else {
    // otherwise, if not doing any of the above, show the start screen
    startScreen.display();
  }
}
