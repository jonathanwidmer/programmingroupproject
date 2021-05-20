class Timeline{
  PImage background;
  PImage arrow;
  boolean back = false;
  
  Timeline() {
    background = loadImage("MazeTimeline.png");
    arrow = loadImage("arrow.png");
  }
  
  void display() {
    image(background, 0, 0);
    image(arrow, 1215, 15);
  }
}
