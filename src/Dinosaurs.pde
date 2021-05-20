class Dinosaur {
  int x, y, w, h, speed, health;
  color c;
  PImage dinosaur;
  int rand;
  boolean isPu;

  //constructor
  Dinosaur(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    health = 10;
    speed = int(random(5, 11));
    isPu = false;
    rand = int(random(1, 10));
    if (random(100)>90) {
      isPu = true;
      dinosaur = loadImage("powerup.png");
    } else {
      isPu = false;
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

  void display() {
    imageMode(CENTER);
    image(dinosaur, x, y);
  }

  void move() {
    y+=speed;
  }
  
  void move(int d) {
    y += d*speed;
  }
  
  void setX(int tempX) {
    x = tempX;
  }

  boolean reachedBottom() {
    // ternary statement
    return (y>height+50) ? true : false;
  }
}
