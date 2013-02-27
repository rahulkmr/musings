package com.misc;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class ButtonTest {
    public static void main (String [] args) {
        ButtonFrame frame = new ButtonFrame();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}

@SuppressWarnings("serial")
class ButtonFrame extends JFrame {
    public ButtonFrame() {
        setTitle("ButtonTest");
        setSize(300, 200);

        JPanel buttonPanel = new JPanel();

        addButton(buttonPanel, "Yellow", Color.YELLOW);
        addButton(buttonPanel, "Blue", Color.BLUE);
        addButton(buttonPanel, "Red", Color.RED);

        add(buttonPanel);
    }

    private JButton addButton(final JPanel panel, String name, final Color backgroundColor) {
        JButton button = new JButton(name);
        button.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                panel.setBackground(backgroundColor);
            }
        });
        panel.add(button);
        return button;
    }
}
