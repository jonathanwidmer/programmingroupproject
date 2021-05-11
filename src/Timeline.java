import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

/**
 * @author Aaron Wang
 *
 * The Timeline class displays a timeline of 
 * dinosaurs and information about them.
 */

public class Timeline extends JFrame {
	
	/**
	 * declare the member variables
	 */
	private JPanel contentPane;
	private BufferedImage img; // background image
	private JLabel background;
	
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Timeline frame = new Timeline();
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
	public Timeline() {
		
		/**
		 * instantiate the background image
		 */
		try {
			img = ImageIO.read(new File("Timeline.png"));
		} catch (IOException e) {
			System.out.println("File not found");
		}
		
		/**
		 * set the boundaries of the JFrame
		 */
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		setBounds(100, 100, img.getWidth(), img.getHeight());
		
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
		background = new JLabel(new ImageIcon("Timeline.png"));
		background.setBounds(0, 0, img.getWidth(), img.getHeight());
		add(background);
	}

}

