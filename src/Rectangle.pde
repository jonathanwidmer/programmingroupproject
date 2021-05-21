/**
  The Rectangle class represents the walls of the maze.
*/

class Rectangle {
  // declare global variables
  int x; // x-coordinate of upper left corner
  int y; // y-coordinate of upper left corner
  int w; // width of rectangle
  int h; // height of rectangle
  boolean hit = false; // whether or not the player hit the rectangle
  
  /**
    Constructor
    @param int x x-coordinate of upper left corner
    @param int y y-coordinate of upper left corner
    @param int w width of rectangle
    @param int h height of rectangle
  */
  Rectangle(int x, int y, int w, int h) {
    // initialize attributes
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  /**
    @param Player p1 the player being tested
    @return if the player is in contact with the wall
  */
  boolean collision(Player p1) {
    // by default, the player has not hit the rectangle
    hit = false;
    
    // if the player is in contact with the wall, they have hit the rectangle
    if(p1.x>=x-10 && p1.x<=x+w+10 && p1.y>=y-20 && p1.y<=y+h+20) {
      hit = true;
    }
    return hit;
  }

}
