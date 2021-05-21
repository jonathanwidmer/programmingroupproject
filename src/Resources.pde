/**
  The Resources class contains links to websites with more information about dinosaurs.
*/

class Resources{
  // declare global variables
  PImage background; // image of resources page
  
  /**
    Constructor
  */
  Resources() {
    // initialize image of resources page
    background = loadImage("Resources.png");
  }
  
  /**
    Displays the Resources page
  */
  void display() {
    // display the resources image
    background(background);

    // display the links
    textAlign(LEFT);
    textSize(20);
    fill(255);
    text("https://www.nationalgeographic.com/animals/facts/tyrannosaurus-rex", 100, 300);
    text("https://www.nhm.ac.uk/discover/dino-directory/brachiosaurus.html", 100, 350);
    text("https://www.nationalgeographic.com/animals/facts/triceratops-horridus", 100, 400);
    
    // if the mouse is hovering over one of the links, turn it blue and underline it
    if(mouseX>=100 && mouseX<=800 && mouseY>=280 && mouseY<=300) {
      fill(0, 0, 255);
      text("https://www.nationalgeographic.com/animals/facts/tyrannosaurus-rex", 100, 300);
      line(100, 300, 800, 300);
    } else if (mouseX>=100 && mouseX<=770 && mouseY>=330 && mouseY<=350) {
      fill(0, 0, 255);
      text("https://www.nhm.ac.uk/discover/dino-directory/brachiosaurus.html", 100, 350);
      line(100, 350, 770, 350);
    } else if (mouseX>=100 && mouseX<=815 && mouseY>=380 && mouseY<=400) {
      fill(0, 0, 255);
      text("https://www.nationalgeographic.com/animals/facts/triceratops-horridus", 100, 400);
      line(100, 400, 815, 400);
    }
    
    // if the mouse presses on a link, open it in the browser
    if(mousePressed) {
      println(mouseX + " " + mouseY);
      if(mouseX>=100 && mouseX<=800 && mouseY>=280 && mouseY<=300) {
        link("https://www.nationalgeographic.com/animals/facts/tyrannosaurus-rex");
      } else if (mouseX>=100 && mouseX<=770 && mouseY>=330 && mouseY<=350) {
        link("https://www.nhm.ac.uk/discover/dino-directory/brachiosaurus.html");
      } else if (mouseX>=100 && mouseX<=815 && mouseY>=380 && mouseY<=400) {
        link("https://www.nationalgeographic.com/animals/facts/triceratops-horridus");
      }
    }
  }
  
}
