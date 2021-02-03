import javax.swing.*;

public class LevelOneViewer{
  public static void main(String[] args){
    JFrame frame = new JFrame();
    frame.setSize(500, 500);
    frame.setTitle("Level 1");
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    LevelOne level = new LevelOne();
    frame.add(level);
    frame.setVisible(true);
  }
}
