/**
  Displays the actual game, player, dinosaurs, and maze
*/
class World {
  // declare global variables
  ArrayList<Dinosaur> dinosaurs; // ArrayList of Dinosaurs
  ArrayList<Level> levels; // ArrayList of Levels
  Timer dinosaurTimer; // 
  Level levelOne; // level one
  Level levelTwo; // level two
  
  int dinosaurRate = 100; // rate at which dinosaurs fall (in ms)
  int score = 0; // score of player
  int dinosaursPassed = 0; // dinosaurs that have passed
  int curLevel = 1; // current level
  color value = color(62, 153, 41); // color for the buttons
  
  boolean play = false; // 
  boolean win = false; // if the user has won
  boolean restartGame = false; // if the user wants to restart the game
  boolean endGame = false; // if the user wants to end the game
  boolean nextLevel = false; // if the user wants to go to the next level
  
  PImage gameOver; // image shown when game is over
  PImage winImage; // image shown when player wins
  PImage thankYouImage; // image shown when player exits game
  
  
  World(Player p1) {
    // initialize ArrayList containing Dinosaurs
    dinosaurs = new ArrayList<Dinosaur>();  
    
    // initialize LevelOne and LevelTwo and add to ArrayList
    levels = new ArrayList<Level>();
    levelOne = new LevelOne();
    levelTwo = new LevelTwo();
    levels.add(levelOne);
    levels.add(levelTwo);
    
    // initialize and start dinosaurTimer
    dinosaurTimer = new Timer(dinosaurRate);
    dinosaurTimer.start();
    
    // intialize and resize images
    gameOver = loadImage("gameover.png");
    gameOver.resize(1280, 720);
    winImage = loadImage("winningscreen.png");
    winImage.resize(1280, 720);
    thankYouImage = loadImage("thanksForPlaying.png"); 
  }  
  
  /**
  * Displays the current level and maze, Dinosaurs, and Player.
  */
  void display() {
    // display the current level
    levels.get(curLevel-1).display();
    
    // draw the info panel
    infoPanel();
    
    // write what level it is
    textSize(20);
    fill(255);
    text("Level: " + curLevel, 50, 35);
    
    // distribution of dinosaurs
    if (dinosaurTimer.isFinished()) {
      if(curLevel == 1) {
        dinosaurs.add(new Dinosaur(int(random(width-100)+50), -50, 10));
      } else if (curLevel == 2) {
        dinosaurs.add(new Dinosaur(int(random(width-100)+50), -50, 15));
      }
      dinosaurTimer.start();
    }
 
    // render dinosaurs
    // iterate through ArrayList of Dinosaurs
    for (int i = dinosaurs.size()-1; i>0; i--) {
      // get Dinosaur
      Dinosaur dinosaur = (Dinosaur) dinosaurs.get(i);
      
      // move dinosaur
      dinosaur.move();
      
      // display dinosaur
      dinosaur.display();
      
      // if the dinosaur reached the bottom, remove it, and increment the score
      if (dinosaur.reachedBottom()) {
        dinosaurs.remove(dinosaur);
        dinosaursPassed++;
        score+=1;
      }

      // player vs dinosaur collision
      // if distance between player and dinosaur is less than 25
      if (dist(p1.x, p1.y, dinosaur.x, dinosaur.y)<=25) {
        // if the dinosaur is a powerup, add 10 to the player health and score, and remove the powerup
        if (dinosaur.isPu) {
          p1.health+=10;
          score+=10;
          dinosaurs.remove(dinosaur);
        } else { 
          // otherwise remove the dinosaur's health and score from the player, and remove the dinosaur
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
    // check if wall and player have collided
    for(int i = 0; i < levels.get(curLevel-1).rectangles.size(); i ++) {
      if(levels.get(curLevel-1).rectangles.get(i).collision(p1)) {
        r = levels.get(curLevel-1).rectangles.get(i);
        hit = true;
      }
    }
    
    // determine what direction the wall is at
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
    
    // arrow controls for moving player
    // moves 3 units in the direction indicated
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
       } else if (keyCode==UP && p1.y>65) {
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
    
    // check if user won
    win = levels.get(curLevel-1).won(p1.x, p1.y);
    
    // display the player
    p1.display();
    
    //game over logic
    if (p1.health<1) {
      // if player died, go to losing screen
      play = false;
      dinosaurs.clear();
      gameOver();
    } else if (win) {
      // if player won, go to winning screen
      play = false;
      dinosaurs.clear();
      playerWon();
    } else {
      // otherwise, keep playing
      play = true;
    }
  }
  
  /**
    Displays an information panel about the player containing health, score, and dinosaurs passed
  */
  void infoPanel() {
    // display score, health, and dinosaurs passed
    fill(255);
    textAlign(LEFT);
    textSize(15);
    text("Score: "+ score, 50, 690);
    text("Health: " + p1.health, 50, 710);
    text("Dinosaurs passed: " + dinosaursPassed, 50, 670);
  }
  
  /**
    Displays a GameOver screen if the user has lost (health<1)
    Displays buttons to play the level again or exit the game
  */
  void gameOver() {
    // draw GameOver screen
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
    
    // draw buttons to play the level again or exit the game
    fill(value);
    stroke(0);
    rect(50, height/2-175, 200, 100); // play again
    rect(50, height/2-50, 200, 100); // exit game
    fill(0);
    textSize(20);
    text("Play Again", 150, height/2-115);
    text("Exit Game", 150, height/2+10); 
    
    restartGame = false;
    endGame = false;
    
    // if the mouse presses on a button
    if (mousePressed){
      if(mouseX>=50 && mouseX<=250 && mouseY>=height/2-175 && mouseY<=height/2-75){
        // if the mouse presses the play again button, set restartGame to true
        restartGame = true;
      } else if (mouseX>=50 && mouseX<=250 && mouseY>=height/2-50 && mouseY<=height/2+50) {
        // if the mouse presses the exit game button, set endGame to true
        endGame = true;
      }
      
      if(restartGame){
        // if the user presses the restartGame button, reset everything 
        win = false;
        score = 0;
        dinosaursPassed = 0;
        p1.health = 100;
        p1.x = levels.get(curLevel-1).startX;
        p1.y = levels.get(curLevel-1).startY;
        dinosaurRate = levels.get(curLevel-1).dinoRate;
      } else if (endGame){
        // otherwise don't display the win screen and exit the game
        win = false;
      }
    }
  }
  
  /**
    Displays a winning screen if the player won (reached the target)
    Displays buttons to play the level again, exit the game, or go to the next level, if there is one
  */
  void playerWon() {
    // draw the winning screen
    background(winImage);
    
    // draw player info
    textAlign(CENTER);
    textSize(40);
    fill(255);
    text("You win!", width/2, 60);
    text("Score: " + score, width/2, 110);
    text("Dinosaurs Passed: " + dinosaursPassed, width/2, 160);
    
    // draw buttons to play the level again, exit the game, or go to the next level, if there is one
    fill(value);
    stroke(0);
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
    
    // by default, restartGame, endGame, and nextLevel are false
    restartGame = false;
    endGame = false;
    nextLevel = false;
    
    // if mouse presses on a button
    if (mousePressed){
      
      if(mouseX>=50 && mouseX<=250 && mouseY>=height/2-175 && mouseY<=height/2-75){
        // if the mouse presses the play again button, set restartGame to true
        restartGame = true;
        
      } else if (mouseX>=50 && mouseX<=250 && mouseY>=height/2-50 && mouseY<=height/2+50) {
        // if the mouse presses the exit game button, set endGame to true
        endGame = true;
        
      } else if (mouseX>=50 && mouseX<=250 && mouseY>=height/2-300 && mouseY<=height/2-200) {
        // if there is a next level
        if(curLevel<2) {
          
          // if the mouse presses the next level button, set nextLevel to true
          curLevel ++;
          nextLevel = true;
        }
      }
      
      if(restartGame){
        // if the user presses the restartGame button, reset everything 
        win = false;
        score = 0;
        dinosaursPassed = 0;
        p1.health = 100;
        p1.x = levels.get(curLevel-1).startX;
        p1.y = levels.get(curLevel-1).startY;
        dinosaurRate = levels.get(curLevel-1).dinoRate;
      } else if (endGame){
        // otherwise if the user presses the endGame button, don't display the win screen and exit the game
        win = false;
        
      } else if (nextLevel) {
        // otherwise if the user presses the nextLevel button, set the information to the next level
        win = false;
        score = 0;
        dinosaursPassed = 0;
        p1.health = 100;
        p1.x = levels.get(curLevel-1).startX;
        p1.y = levels.get(curLevel-1).startY;
        dinosaurRate = levels.get(curLevel-1).dinoRate;
      }
    }
  }
}
