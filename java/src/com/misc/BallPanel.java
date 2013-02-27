package com.misc;

import java.awt.*;
import javax.swing.*;
import java.util.ArrayList;

import com.misc.Ball;

@SuppressWarnings("serial")
public class BallPanel extends JPanel {
    private ArrayList<Ball> balls = new ArrayList<Ball>();

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2 = (Graphics2D)g;
        for (Ball b : balls)
            g2.fill(b.getShape());
    }

    public void addBall(Ball b) {
        balls.add(b);
    }
}
