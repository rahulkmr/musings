package com.misc;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

import com.misc.Ball;
import com.misc.BallPanel;

public class Bounce {
    public static void main (String [] args) {
        JFrame frame = new BounceFrame();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}

@SuppressWarnings("serial")
class BounceFrame extends JFrame {
    public static final int DELAY = 2;
    private BallPanel panel = new BallPanel();

    public BounceFrame() {
        setSize(450, 350);
        setTitle("Bounce");

        add(panel, BorderLayout.CENTER);
        addButtons();
    }


    private void addButtons() {
        JPanel buttonPanel = new JPanel();

        JButton add = new JButton("Add ball");
        add.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                addBall();
            }
        });
        buttonPanel.add(add);

        JButton close = new JButton("Close");
        close.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                System.exit(0);
            }
        });
        buttonPanel.add(close);

        add(buttonPanel, BorderLayout.SOUTH);
    }

    private void addBall() {
        final Ball ball = new Ball(panel);
        panel.addBall(ball);
        Thread t = new Thread(new Runnable() {
            public void run() {
                try {
                    for (;;) {
                        ball.move();
                        Thread.sleep(DELAY);
                    }
                } catch (Exception ex) {
                }
            }
        });
        t.start();
    }
}
