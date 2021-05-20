class StartScreen {
  Timeline timeline;
  Resources resources;
  TitleScreen titleScreen;
  boolean startGame = false;
  boolean viewResources = false;
  boolean viewTimeline = false;
  PImage startImage;
  
  StartScreen(){
    startImage = loadImage("MainMenu.png");
    timeline = new Timeline();
    resources = new Resources();
    titleScreen = new TitleScreen();
  }
  
  void display() {
    background(0);
    imageMode(CORNER);
    image(startImage, 0, 0);
    
    // info about the game
    textAlign(CENTER);
    textSize(60);
    fill(255);
    text("Cretaceous Maze Adventure", width/2, 60);
    textSize(30);
    text("By Jonathan Widmer, Aiden DeBoer", width/2, height-150);
    text("Aaron Wang, William Bastian", width/2, height-120);
    text("Instructions:", width/2, height-90);
    text("Click on buttons to take you to different pages", width/2, height-60);
    text("Use the arrows to navigate", width/2, height-30);
    
    // logic to take the user to the next step
    // if user presses...
    if (mousePressed) {
      if(mouseX>80 && mouseX<310 && mouseY>80 && mouseY <210) {
          // user presses on start game, then start game
          startGame= true;
          viewTimeline = false;
          viewResources = false;
      } else if(mouseX>80 && mouseX<310 && mouseY>280 && mouseY<410) {
          // user presses on timeline, then go to timeline
          viewTimeline = true;
          startGame = false;
          viewResources = false;
      } else if(mouseX>80 && mouseX<310 && mouseY>480 && mouseY<610) {
          // user presses on resources, go then to resources
          viewResources = true;
          viewTimeline = false;
          startGame = false;
      }  
    }
  }
}
