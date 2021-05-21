/**
  The Player class creates a Player that the user maneuvers.
  The user attempts to maneuver the Player to the end of the maze
  without losing all of their health.
*/

class Player {
  int x, y; // x and y coordinates of the player
  int health; // health of the player
  PImage player; // image of the player

  /**
    Constructor
  */
  Player(int x, int y) {
    // initialize location of the player
    this.x = x;
    this.y = y;
    
    // initialize health of player
    health = 100;
    
    // initialize and resize player image
    player = loadImage("Player.png");
    player.resize(48, 48);
  }
  
  /**
    Displays the player on the screen
    @param tempX x-coordinate of the player
    @param tempY y-coordinate of the player
  */
  void display(int tempX, int tempY) {
    // set x and y to tempX and tempY
    x = tempX;
    y = tempY;
    
    // display player
    imageMode(CENTER);
    image(player, x, y);
  }
  
  /**
    Displays the player on the screen
  */
  void display() {
    // display player
    imageMode(CENTER);
    image(player, x, y);
  }
}
