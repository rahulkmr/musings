package com.misc;

import java.awt.*;
import java.awt.geom.*;
import javax.swing.*;

public class DrawTest {
    public static void main(String[] args) {
        JFrame frame = new JFrame();
        frame.setTitle("DrawTest");
        frame.setSize(400, 400);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        DrawComponent c = new DrawComponent();
        frame.add(c);

        frame.setVisible(true);
    }
}

@SuppressWarnings("serial")
class DrawComponent extends JComponent {
    @Override
    public void paintComponent(Graphics g) {
        Graphics2D g2 = (Graphics2D) g;
        double leftX = 100, topY = 100, width = 200, height = 150;

        Rectangle2D rect = new Rectangle2D.Double(leftX, topY, width, height);
        g2.draw(rect);

        Ellipse2D ellipse = new Ellipse2D.Double();
        ellipse.setFrame(rect);
        g2.draw(ellipse);

        g2.draw(new Line2D.Double(leftX, topY, leftX + width, topY + height));

        double centerX = rect.getCenterX(), centerY = rect.getCenterY(), radius = 150;
        Ellipse2D circle = new Ellipse2D.Double();
        circle.setFrameFromCenter(centerX, centerY, centerX + radius, centerY
                + radius);
        g2.draw(circle);
    }
}
