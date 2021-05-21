/**
  The Dinosaur class creates a Dinosaur that the user attempts to avoid. 
  If the user is hit by a Dinosaur, they will lose health. 
  If the Dinosaur is a powerup, the user will gain health. 
  Dinosaurs disappear after they are hit or reach the bottom of the screen.
*/
class Dinosaur {
  int x, y, speed, health; // attributes of dinoaur
  PImage dinosaur; // image of dinosaur
  int rand; // random number for dinosaur type
  boolean isPu; // whether or not it is a powerup

  
  /**
    Constructor
    Constructs a Dinosaur at location x,y and with a width of w and a height of h
    @param int x
    @param int y
    @param int w
    @param int h
  */
  Dinosaur(int x, int y, int h) {
    this.x = x;
    this.y = y;
    
    // set health equal to 10
    health = h; 
    
    // set random speed
    speed = int(random(5, 11));
    
    // by default, dinosaur is not a powerup
    isPu = false;
    
    // get random integer
    rand = int(random(1, 10));
    
    if (random(100)>90) {
      // 10% of the time, dinosaur is a powerup
      isPu = true;
      dinosaur = loadImage("powerup.png");
    } else {
      // not a powerup
      isPu = false;
      
      // set image of dinosaur based on random number
      if (rand == 1) {
        dinosaur = loadImage ("Dinos-1.png");
      } else if (rand == 2) {
        dinosaur = loadImage ("Dinos-2.png");
      } else if (rand == 3) {
        dinosaur = loadImage ("Dinos-3.png");
      } else if (rand == 4) {
        dinosaur = loadImage ("Dinos-4.png");
      } else if (rand == 5) {
        dinosaur = loadImage ("Dinos-5.png");
      } else if (rand == 6) {
        dinosaur = loadImage ("Dinos-6.png");
      } else if (rand == 7) {
        dinosaur = loadImage ("Dinos-7.png");
      } else if (rand == 8) {
        dinosaur = loadImage ("Dinos-8.png");
      } else if (rand == 9) {
        dinosaur = loadImage ("Dinos-9.png");
      }
    }
  }
  
  /**
    Draws the dinosaur on the screen
  */
  void display() {
    // displays the dinosaur
    imageMode(CENTER);
    image(dinosaur, x, y);
  }
  
  /**
    Moves the dinosaur down the screen
  */
  void move() {
    y+=speed;
  }
  
  /**
    @return if the dinosaur has reached the bottom
  */ 
  boolean reachedBottom() {
    // ternary statement
    // if the dinosaur is past the bottom, return true
    return (y>height+50) ? true : false;
  }
}
