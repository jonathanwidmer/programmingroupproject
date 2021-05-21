/**
  The LevelTwo class is the second level of the game.
*/

class LevelTwo extends Level {
  
  /**
    Constructor
    Adds the interior maze walls to an ArrayList of Rectangles
  */
  LevelTwo() {
    // superconstructor
    super(1120, 530, 100, 100, 190, 180, 50); // construct Level
    
    // adds the interior maze walls to an ArrayList of Rectangles
    // will be used for collision detection
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
  
  /**
    Displays the LevelTwo maze
    Draws the sides and interior maze walls
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
    rect(40, 250, 260, 30); // horizontal
    rect(110, 340, 190, 30); // horizontal
    rect(270, 270, 30, 80); // vertical
    
    rect(270, 110, 30, 70); // vertical
    rect(110, 110, 170, 30); // horizontal
    
    rect(380, 110, 340, 30); // horizontal
    rect(800, 110, 110, 30); // horizontal
    rect(900, 110, 30, 190); // vertical
    rect(920, 270, 150, 30); // horizontal
    rect(1000, 110, 150, 30); // horizontal
    rect(1000, 110, 30, 90); // vertical
    
    rect(400, 220, 380, 30); // horizontal
    rect(700, 440, 80, 30); // horizontal
    rect(770, 220, 30, 250); // vertical
    rect(790, 370, 360, 30); // horizontal
    rect(410, 330, 260, 30); // horizontal
    rect(580, 350, 30, 120); // vertical
    
    rect(1140, 110, 30, 290); // vertical
    rect(1130, 480, 110, 30); // horizontal
    rect(1160, 330, 80, 30); // horizontal
    
    rect(120, 440, 30, 150); // vertical
    rect(140, 440, 100, 30); // horizontal
    rect(240, 550, 30, 110); // vertical
    rect(260, 550, 170, 30); // horizontal
    rect(520, 550, 360, 30); // horizontal
    rect(870, 480, 30, 100); // vertical
    rect(890, 480, 130, 30); // horizontal
    rect(500, 460, 30, 200); // vertical
    rect(340, 440, 250, 30); // horizontal
    
    // draw end of maze target
    noFill();
    stroke(255);
    rect(x, y, w, h);
    imageMode(CENTER);
    image(flags, x+w/2,  y+h/2);
  }
}
