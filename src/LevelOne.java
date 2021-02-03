import javax.swing.*;
import java.awt.*;
import java.awt.geom.*;

public class LevelOne extends JComponent{
  public void paintComponent(Graphics g){
    Graphics2D g2 = (Graphics2D) g;
    //background
    g2.setColor(Color.GREEN);
    Rectangle background = new Rectangle(0, 0, 500, 500);
    g2.fill(background);
    //setting
    g2.setColor(Color.WHITE);
    Rectangle setting = new Rectangle(15, 15, 470, 470);
    g2.fill(setting);
    //player
    g2.setColor(Color.BLUE);
    Ellipse2D.Double player = new Ellipse2D.Double(20,20,15,15);
    g2.fill(player);
    g2.draw(player);
    //enemies
    g2.setColor(Color.RED);
    Rectangle enemy1 = new Rectangle(450,20,15,15);
    g2.fill(enemy1);
    //enemy2
    g2.setColor(Color.RED);
    Rectangle enemy2 = new Rectangle(450,200,15,15);
    g2.fill(enemy2);
    //enemy3
    g2.setColor(Color.RED);
    Rectangle enemy3 = new Rectangle(450,400,15,15);
    g2.fill(enemy3);
    //treasure
    Line2D.Double treasure1 = new Line2D.Double(450,450,480,480);
    g2.setColor(Color.BLACK);
    g2.draw(treasure1);

    Line2D.Double treasure2 = new Line2D.Double(480,450,450,480);
    g2.setColor(Color.BLACK);
    g2.draw(treasure2);
    //obstacles
    Rectangle tree1 = new Rectangle(205,160,40,70);
    g2.setColor(Color.ORANGE);
    g2.fill(tree1);
    g2.setColor(Color.GREEN);
    Ellipse2D.Double treetop = new Ellipse2D.Double(195,135,70,50);
    g2.fill(treetop);
    g2.draw(treetop);
    //rock
    g2.setColor(Color.LIGHT_GRAY);
    Ellipse2D.Double rock = new Ellipse2D.Double(230,320,80,50);
    g2.fill(rock);
    g2.draw(rock);
    }
}
