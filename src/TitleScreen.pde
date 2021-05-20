class TitleScreen {
  PImage background;
  PImage arrow;
  boolean play=false;

  // constructor
  TitleScreen() {
    background = loadImage("TitleScreen.png");
    arrow = loadImage("arrow.png");
  }
  
  void display() {
    background(0);
    imageMode(CORNER);
    image(background, 0, 0);
    image(arrow, 1215, 15);
    textAlign(CENTER);
    textSize(30);
    
    if(mousePressed && mouseX>500 && mouseX<770 && mouseY>390 && mouseY<550) {
      play = true;
    }
  }
  
  
}
  
