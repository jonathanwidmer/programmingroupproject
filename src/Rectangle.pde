class Rectangle {
  int x, y, w, h;
  boolean hit;
  
  Rectangle(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    hit = false;
  }
  
  boolean collision(Player p1) {
    if(p1.x>=x-10 && p1.x<=x+w+10 && p1.y>=y-21 && p1.y<=y+h+21) {
      hit = true;
    } else {
      hit = false;
    }
    return hit;
  }

}
