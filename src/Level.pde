/**
  The Level class is used to create different levels of the game.
*/

class Level {
  // declare global variables
  PImage ground; // background
  PImage flags;
  ArrayList<Rectangle> rectangles; // ArrayList to hold walls
  int x, y, w, h; // end of maze target area
  int startX, startY; // starting location of player
  int dinoRate; // interval at which dinosaurs fall
  
  Level(int x, int y, int w, int h, int startX, int startY, int dinoRate) {
    // initialize and resize background to fit screen
    ground = loadImage("ground.jpg");
    ground.resize(1280, 720);
    flags = loadImage("flags.gif");
    flags.resize(100, 100);
    
    // initialize rectangles ArrayList
    rectangles = new ArrayList();
    
    // initialize attributes
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.startX = startX;
    this.startY = startY;
    this.dinoRate = dinoRate;
  }
  
  /**
    Display the maze
  */
  public void display() {
    // display the background
    background(ground);
    fill(62, 153, 41);
    noStroke();
    rect(0, 650, width, 70);
  }
  
  /**
    Checks if the given point is inside the end of maze target area
    @param int x the x-coordinate being checked
    @param int y the y-coordinate being checked
  */
  public boolean won(int x, int y) {
    // returns if the given point is inside the end of maze target area
    return x>=this.x && x<=this.x+w && y>=this.y && y<=this.y+h;
  }
}
