/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * @author danang aji
 */
package Aplikasi;

import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import javax.swing.ImageIcon;
import javax.swing.JPanel;

public class Background extends JPanel {
    private Image image;
    
    public Background(){
        image = new ImageIcon(getClass().getResource("/gambar/backgroundHotel.png")).getImage();
    }
    @Override //overriding
    protected void paintComponent(Graphics grphcs){ //access mod + procedure
        super.paintComponent(grphcs);
        
        Graphics2D gd = (Graphics2D)grphcs.create(); //object
        gd.drawImage(image,0,0,getWidth(),getHeight(),null);
        gd.dispose(); 
    }
}
