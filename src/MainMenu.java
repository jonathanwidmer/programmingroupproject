import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import javax.swing.border.EmptyBorder;
import javax.swing.*;
import java.io.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

/**
 * @author Aaron Wang
 * 
 * The MainMenu class displays the home page. This is the page that
 * is displayed when the user first opens the game. It has buttons
 * that can take the user to start the game, resources, and a 
 * timeline with information about the dinosaurs.
 * 
 */

public class MainMenu extends JFrame {
	
	/**
	 * declare member variables
	 */
	private JPanel contentPane;
	private BufferedImage img; // the background image
	private JLabel background;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) throws IOException{
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					MainMenu frame = new MainMenu();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public MainMenu() {
		
		/**
		 * instantiate the background image
		 */
		try {
			img = ImageIO.read(new File("MainMenu.png"));
		} catch (IOException e) {
		}
		
		/**
		 * set the boundaries of the JFrame
		 */
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1290, 750);
		
		/**
		 * instantiate the JPanel
		 */
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		/**
		 * declare and instantiate the JLabel background
		 * this is contains the background image
		 */
		background = new JLabel(new ImageIcon("MainMenu.png"));
		background.setBounds(0, 0, img.getWidth(), img.getHeight());
		add(background);
		
		/**
		 * declare and instantiate the JButton start
		 * add start to the background
		 * when the user clicks it, it takes the user to a new
		 * frame of class TitleScreen where they can start
		 * the game
		 */
		JButton start = new JButton("START");
		start.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				try {
					TitleScreen frame = new TitleScreen();
					frame.setVisible(true);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			}
		});
		start.setBounds(70, 90, 250, 135);
		background.add(start);
		
		/**
		 * declare and instantiate the JButton timeline
		 * add timeline to the background
		 * when the user clicks it, it takes the user to a new
		 * frame of class Timeline where there is a timeline of
		 * the dinosaurs
		 */
		JButton timeline = new JButton("TIMELINE");
		timeline.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				try {
					Timeline frame = new Timeline();
					frame.setVisible(true);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			}
		});
		timeline.setBounds(70, 290, 250, 135);
		background.add(timeline);
		
		/**
		 * declare and instantiate the JButton resources
		 * add resources to the background
		 * when the user clicks it, it takes the user to a new
		 * frame of class Resources where there is a list of websites
		 * that can help them learn more about dinosaurs
		 */
		JButton resources = new JButton("RESOURCES");
		resources.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				try {
					Resources frame = new Resources();
					frame.setVisible(true);
				} catch (Exception e1) {
					e1.printStackTrace();
				}

			}
		});
		resources.setBounds(70, 490, 250, 135);
		background.add(resources);
	}

}
