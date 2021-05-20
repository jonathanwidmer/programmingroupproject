class LevelTwo extends Level {
  PImage ground;
  int startX = 190;
  int startY = 180;
  
  LevelTwo() {
    super(10, 1120, 530, 100, 100);
    ground = loadImage("ground.jpg");
    ground.resize(1280, 720);
    dinos = 10;
    
    // sides
    /*
    rectangles.add(new Rectangle(0, 0, 50, height)); // vertical
    rectangles.add(new Rectangle(50, 0, width-50, 50)); // horizontal
    rectangles.add(new Rectangle(width-50, 0, 50, height)); // vertical
    */
  
    rectangles.add(new Rectangle(40, 250, 260, 30));
    rectangles.add(new Rectangle(110, 340, 190, 30));
    rectangles.add(new Rectangle(270, 270, 30, 80));
    
    rectangles.add(new Rectangle(270, 110, 30, 70));
    rectangles.add(new Rectangle(110, 110, 170, 30));
    rectangles.add(new Rectangle(270, 270, 30, 80));
    
    rectangles.add(new Rectangle(110, 110, 170, 30));
    rectangles.add(new Rectangle(270, 270, 30, 80));
    
    rectangles.add(new Rectangle(380, 110, 340, 30));
    rectangles.add(new Rectangle(800, 110, 110, 30));
    rectangles.add(new Rectangle(900, 110, 30, 190));
    rectangles.add(new Rectangle(920, 270, 150, 30));
    rectangles.add(new Rectangle(1000, 110, 150, 30));
    rectangles.add(new Rectangle(1000, 110, 30, 90));

    rectangles.add(new Rectangle(400, 220, 380, 30));
    rectangles.add(new Rectangle(700, 440, 80, 30)); 
    rectangles.add(new Rectangle(770, 220, 30, 250));
    rectangles.add(new Rectangle(790, 370, 360, 30));
    rectangles.add(new Rectangle(410, 330, 260, 30));
    rectangles.add(new Rectangle(580, 350, 30, 120));

    rectangles.add(new Rectangle(1140, 110, 30, 290));
    rectangles.add(new Rectangle(1130, 480, 110, 30));
    rectangles.add(new Rectangle(1160, 330, 80, 30));
    
    rectangles.add(new Rectangle(120, 440, 30, 150));
    rectangles.add(new Rectangle(140, 440, 100, 30));
    rectangles.add(new Rectangle(240, 550, 30, 110));
    rectangles.add(new Rectangle(260, 550, 170, 30));
    rectangles.add(new Rectangle(520, 550, 360, 30));
    rectangles.add(new Rectangle(870, 480, 30, 100));
    rectangles.add(new Rectangle(890, 480, 130, 30));
    rectangles.add(new Rectangle(500, 460, 30, 200));
    rectangles.add(new Rectangle(340, 440, 250, 30));
  }
  
  void display(){
    background(ground);
    fill(62, 153, 41);
    noStroke();
    
    rect(0, 0, 50, height); // vertical
    rect(50, 0, width-50, 50); // horizontal
    rect(width-50, 0, 50, height); // vertical
    
    rect(40, 250, 260, 30); // horizontal
    rect(110, 340, 190, 30); // h
    rect(270, 270, 30, 80); // v
    
    rect(270, 110, 30, 70); // vertical
    rect(110, 110, 170, 30); // h
    
    rect(380, 110, 340, 30); // h
    rect(800, 110, 110, 30); // h
    rect(900, 110, 30, 190); // v
    rect(920, 270, 150, 30); // h
    rect(1000, 110, 150, 30); // h
    rect(1000, 110, 30, 90); // v
    
    rect(400, 220, 380, 30); // h
    rect(700, 440, 80, 30); // h
    rect(770, 220, 30, 250); // v
    rect(790, 370, 360, 30); // h
    rect(410, 330, 260, 30); // h
    rect(580, 350, 30, 120); // v
    
    rect(1140, 110, 30, 290); // v
    rect(1130, 480, 110, 30); // h
    rect(1160, 330, 80, 30); // h
    
    rect(120, 440, 30, 150); // v
    rect(140, 440, 100, 30); // h
    rect(240, 550, 30, 110); // v
    rect(260, 550, 170, 30); // h
    rect(520, 550, 360, 30); // h
    rect(870, 480, 30, 100); // v
    rect(890, 480, 130, 30); // h
    rect(500, 460, 30, 200); // v
    rect(340, 440, 250, 30); // h
    
    noFill();
    stroke(255);
    rect(x, y, w, h);
  }
}
