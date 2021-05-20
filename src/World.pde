class World {
  ArrayList<Dinosaur> dinosaurs;
  ArrayList<Level> levels;
  Timer dinosaurTimer;
  Level levelOne;
  Level levelTwo;
  Level levelThree;
  Dinosaur dino;
  
  int dinosaurRate = 100;
  int score = 0;
  int dinosaursPassed = 0;
  int curLevel = 1;
  color value = color(62, 153, 41);
  
  boolean play = false;
  boolean win = false;
  boolean restartGame = false;
  boolean endGame = false;
  boolean nextLevel = false;
  
  PImage startImage;
  PImage gameOver;
  PImage winImage, thankYouImage;
  
  World(Player p1) {
    dinosaurs = new ArrayList<Dinosaur>();  // collections arraylist
    
    levels = new ArrayList<Level>(); // collections arraylist
    levelOne = new LevelOne();
    levelTwo = new LevelTwo();
    levels.add(levelOne);
    levels.add(levelTwo);
    
    dinosaurTimer = new Timer(dinosaurRate);
    dinosaurTimer.start();
    
    startImage = loadImage("MainMenu.png");
    gameOver = loadImage("gameover.png");
    gameOver.resize(1280, 720);
    winImage = loadImage("winningscreen.png");
    winImage.resize(1280, 720);
    thankYouImage = loadImage("thanksForPlaying.png"); 
  }  
  
  void display() {
    levels.get(curLevel-1).display();
    
    // draw the info panel
    infoPanel();
    
    // distribution of dinosaurs
    if (dinosaurTimer.isFinished()) {
      dinosaurs.add(new Dinosaur(int(random(width)), -50, 20, 20));
      dinosaurTimer.start();
    }
 
    // render dinosaurs
    for (int i = dinosaurs.size()-1; i>0; i--) {
      Dinosaur dinosaur = (Dinosaur) dinosaurs.get(i);
      dinosaur.move();
      dinosaur.display();
      if (dinosaur.reachedBottom()) {
        dinosaurs.remove(dinosaur);
        dinosaursPassed++;
        score+=1;
      }

      // player vs dinosaur collision
      if (dist(p1.x, p1.y, dinosaur.x, dinosaur.y)<=25) {
        if (dinosaur.isPu) {
          p1.health+=10;
          score+=10;
          dinosaurs.remove(dinosaur);
        } else {
          p1.health-=dinosaur.health;
          score-=dinosaur.health;
          dinosaurs.remove(dinosaur);
        }
      }
    }

    // using key controls to move the player
    Rectangle r = new Rectangle(0, 0, 0, 0);
    boolean hit = false;
    String dir = "";
    for(int i = 0; i < levels.get(curLevel-1).rectangles.size(); i ++) {
      if(levels.get(curLevel-1).rectangles.get(i).collision(p1)) {
        r = levels.get(curLevel-1).rectangles.get(i);
        hit = true;
      }
    }
    if(hit) {
      if(p1.x<=r.x+4) {
        dir = "RIGHT";
      } else if (p1.x>=r.x+r.w-4) {
        dir = "LEFT";
      } else if (p1.y<=r.y+4) {
        dir = "DOWN";
      } else if (p1.y>=r.y+r.h-4) {
        dir = "UP";
      }
    }  

    if(keyPressed) {
      if(key == CODED) {
       if(keyCode==RIGHT && p1.x<width-60) {
         if(!hit || (!dir.equals("RIGHT"))) {
           p1.x += 3;
           p1.display();
         }
       } else if (keyCode==LEFT && p1.x>60) {       
         if(!hit || (!dir.equals("LEFT"))) {
           p1.x -= 3;
           p1.display();
         }
       } else if (keyCode==UP && p1.y>74) {
         if(!hit || (!dir.equals("UP"))) {
           p1.y -= 3;
           p1.display();
         }
       } else if (keyCode==DOWN && p1.y<height-90) {
         if(!hit || (!dir.equals("DOWN"))) {
           p1.y += 3;
           p1.display();
         }
       }
     } 
    }
    
    win = levels.get(curLevel-1).won(p1.x, p1.y);
    
    // display the player
    p1.display();
    if (mousePressed) {
      println(mouseX + " " + mouseY);
    }
    //game over logic
    if (p1.health<1) {
      play = false;
      dinosaurs.clear();
      gameOver();
    } else if (win) {
      play = false;
      dinosaurs.clear();
      playerWon();
    } else {
      play = true;
    }
  }
  // information panel about the player containing health, score, and dinosaurs passed
  void infoPanel() {
    fill(62, 153, 41);
    stroke(0);
    rect(0, 650, width, 70);
    fill(255);
    textAlign(LEFT);
    textSize(15);
    text("Score: "+ score, 20, 690);
    text("Health: " + p1.health, 20, 710);
    text("Dinosaurs passed: " + dinosaursPassed, 20, 670);
    text("Level: " + curLevel, 100, 690);
  }
  
  // screen to show when game ends
  void gameOver() {
    background(255);
    imageMode(CORNER);
    image(gameOver, 0, 0);
    textAlign(CENTER);
    fill(242, 66, 255);
    textSize(50);
    text("Game Over", width/2, height/3);
    text("Score: " + score, width/2, height/2+15);
    text("Dinosaurs Passed: " + dinosaursPassed, width/2, height/2+90);
    textSize(50);
    text("You lost!", width/2, height/2+150);
    fill(value);
    rect(50, height/2-175, 200, 100); // play again
    rect(50, height/2-50, 200, 100); // exit game
    fill(0);
    textSize(20);
    text("Play Again", 150, height/2-115);
    text("Exit Game", 150, height/2+10); 
    
    restartGame = false;
    endGame = false;
    
    if(mouseX>=50 && mouseX<=250 && mouseY>=height/2-175 && mouseY<=height/2-75){
      value = color(37, 230, 95);
    } else if (mouseX>=50 && mouseX<=250 && mouseY>=height/2-50 && mouseY<=height/2+50) {
      value = color(37, 230, 95);
      rect(50, height/2-50, 200, 100); // exit game
    } else {
      value = color(62, 153, 41);
    }
    
    if (mousePressed){
      if(mouseX>=50 && mouseX<=250 && mouseY>=height/2-175 && mouseY<=height/2-75){
        restartGame = true;
      } else if (mouseX>=50 && mouseX<=250 && mouseY>=height/2-50 && mouseY<=height/2+50) {
        endGame = true;
      }
      if(restartGame){
        win = false;
        score = 0;
        dinosaursPassed = 0;
        p1.health = 100;
        p1.x = 310;
        p1.y = 170;
      } else if (endGame){
        win = false;
      }
    }
  }
  
  void playerWon() {
    background(0);
    imageMode(CORNER);
    image(winImage, 0, 0);
    textAlign(CENTER);
    textSize(40);
    
    fill(255);
    text("You win!", width/2, 60);
    text("Score: " + score, width/2, 110);
    text("Dinosaurs Passed: " + dinosaursPassed, width/2, 160);
    fill(value);
    rect(50, height/2-175, 200, 100); // play again
    rect(50, height/2-50, 200, 100); // exit game
    if(curLevel<2) {
      rect(50, height/2-300, 200, 100);
    }
    fill(0);
    textSize(20);
    text("Play Again", 150, height/2-115);
    text("Exit Game", 150, height/2+10); 
    if(curLevel<2) {
      text("Next Level", 150, height/2-240);
    }
    restartGame = false;
    endGame = false;
    nextLevel = false;
    
    if(mouseX>=50 && mouseX<=250 && mouseY>=height/2-175 && mouseY<=height/2-75){
      value = color(37, 230, 95);
    } else if (mouseX>=50 && mouseX<=250 && mouseY>=height/2-50 && mouseY<=height/2+50) {
      value = color(37, 230, 95);
    } else if (mouseX>=50 && mouseX<=250 && mouseY>=height/2-300 && mouseY<=height/2-200) {
      if(curLevel<2) {
        value = color(37, 230, 95);
        text("Next Level", width/2, height/2-240);
      }  
    } else {
      value = color(62, 153, 41);
    }
    
    if (mousePressed){
      if(mouseX>=50 && mouseX<=250 && mouseY>=height/2-175 && mouseY<=height/2-75){
        restartGame = true;
      } else if (mouseX>=50 && mouseX<=250 && mouseY>=height/2-50 && mouseY<=height/2+50) {
        endGame = true;
      } else if (mouseX>=50 && mouseX<=250 && mouseY>=height/2-300 && mouseY<=height/2-200) {
        if(curLevel<2) {
          curLevel ++;
          nextLevel = true;
        }
      }
      if(restartGame){
        win = false;
        score = 0;
        dinosaursPassed = 0;
        p1.health = 100;
        if(curLevel == 1) {
          p1.x = 310;
          p1.y = 170;
        } else if (curLevel==2) {
          p1.x = 190;
          p1.y = 180;
          dinosaurRate = 50;
        }
      } else if (endGame){
        win = false;
      } else if (nextLevel) {
        win = false;
        score = 0;
        dinosaursPassed = 0;
        p1.health = 100;
        if(curLevel==2) {
          p1.x = 190;
          p1.y = 180;
          dinosaurRate = 50;
        }
      }
    }
  }
}
