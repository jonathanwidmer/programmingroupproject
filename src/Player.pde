class Player {
  int x, y, w, h, health;
  PImage player;

  //constructor
  Player(int x, int y) {
    this.x = x;
    this.y = y;
    w = 5;
    h = 5;
    health = 100;
    player = loadImage("Player.png");
    player.resize(48, 48);
  }

  void display(int tempX, int tempY) {
    x = tempX;
    y = tempY;
    imageMode(CENTER);
    image(player, x, y);
  }
  
  void display() {
    imageMode(CENTER);
    image(player, x, y);
  }
  
  
}
