/**
  The LevelOne class is the first level of the game.
*/

class LevelOne extends Level {
  
  LevelOne() {
    // superconstructor
    super(1095, 100, 100, 100, 310, 170, 100); // construct Level
    
    // adds the interior maze walls to an ArrayList of Rectangles
    // will be used for collision detection
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
  
  /**
    Displays the LevelOne maze
  */ 
  void display(){
    // draw background
    background(ground);
    
    // set color of walls 
    fill(62, 153, 41);
    noStroke();
    
    // draw sides of maze
    rect(0, 0, 50, height); // vertical - left side
    rect(50, 0, width-50, 50); // horizontal - top
    rect(width-50, 0, 50, height); // vertical - right side
    rect(0, 650, width, 70); // horizontal - bottom
    
    // interior maze walls
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
    
    // draw end of maze target
    noFill();
    stroke(255);
    rect(x, y, w, h);
    imageMode(CENTER);
    image(flags, x+w/2,  y+h/2);
  }
}
