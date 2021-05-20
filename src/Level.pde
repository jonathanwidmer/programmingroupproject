class Level {
  PImage maze;
  PImage gameOver;
  ArrayList<Rectangle> rectangles;
  int score = 0;
  int dinosaursPassed = 0;
  int dinos;
  int x, y, w, h;
  int startX, startY;
  
  Level(int num, int x, int y, int w, int h) {
    maze = loadImage("ground.jpg");
    gameOver = loadImage("gameover.jpg");
    dinos = num*10;
    rectangles = new ArrayList();
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public void display() {
    imageMode(CORNER);
    image(maze, 0, 0);
  }
  
  void infoPanel() {
    fill(0, 255, 0);
    stroke(0);
    rect(0, 650, width, 70);
    fill(255);
    textAlign(LEFT);
    textSize(15);
    text("Score: "+ score, 20, 690);
    text("Health: " + p1.health, 20, 710);
    text("Dinosaurs passed: " + dinosaursPassed, 20, 670);
  }
  
  // screen to show when game ends
  void gameOver() {
    background(0);
    imageMode(CORNER);
    image(gameOver, 0, 0);
    textAlign(CENTER);
    fill(255, 0, 0);
    textSize(70);
    text("Game Over", width/2, height/3);
    text("Score: " + score, width/2, height/2+15);
    text("Dinosaurs Passed: " + dinosaursPassed, width/2, height/2+90);
    noLoop();
  }
  
  public boolean won(int x, int y) {
    return x>=this.x && x<=this.x+w && y>=this.y && y<=this.y+h;
  }
  
  public int getDinos() {
    return dinos;
  }
}
