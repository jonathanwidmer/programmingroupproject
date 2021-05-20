class LevelOne extends Level {
  PImage ground;
  int startX = 310;
  int startY = 170;
  
  LevelOne() {
    super(10, 1095, 100, 100, 100);
    ground = loadImage("ground.jpg");
    ground.resize(1280, 720);
    dinos = 10;
    
    // sides
    /*
    rectangles.add(new Rectangle(0, 0, 50, height)); // vertical
    rectangles.add(new Rectangle(50, 0, width-50, 50)); // horizontal
    rectangles.add(new Rectangle(width-50, 0, 50, height)); // vertical
    */
    rectangles.add(new Rectangle(400, 40, 60, 280)); // vertical
    rectangles.add(new Rectangle(180, 170, 60, 150)); // vertical
    rectangles.add(new Rectangle(230, 260, 170, 60)); // horizontal
    
    rectangles.add(new Rectangle(180, 420, 60, 150)); // vertical
    rectangles.add(new Rectangle(230, 420, 410, 60)); // horizontal
    rectangles.add(new Rectangle(640, 170, 60, 310)); // vertical
    rectangles.add(new Rectangle(690, 170, 180, 60)); // horizontal
    
    rectangles.add(new Rectangle(370, 540, 60, 140)); // vertical
    rectangles.add(new Rectangle(420, 540, 310, 60)); // horizontal
    
    rectangles.add(new Rectangle(1000, 40, 60, 440)); // vertical
    rectangles.add(new Rectangle(850, 420, 160, 60)); // horizontal
  }
  
  void display(){
    background(ground);
    fill(62, 153, 41);
    noStroke();
    
    rect(0, 0, 50, height); // vertical
    rect(50, 0, width-50, 50); // horizontal
    rect(width-50, 0, 50, height); // vertical
    
    rect(400, 40, 60, 280); // vertical
    rect(180, 170, 60, 150); // vertical
    rect(230, 260, 170, 60); // horizontal
    
    rect(180, 420, 60, 150); // vertical
    rect(230, 420, 410, 60); // horizontal
    rect(640, 170, 60, 310); // vertical
    rect(690, 170, 180, 60); // horizontal
    
    rect(370, 540, 60, 140); // vertical
    rect(420, 540, 310, 60); // horizontal
    
    rect(1000, 40, 60, 440); // vertical
    rect(850, 420, 160, 60); // horizontal
    
    noFill();
    stroke(255);
    rect(1095, 100, 100, 100);
  }
}
