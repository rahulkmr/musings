package com.misc;

import java.awt.BorderLayout;
import java.awt.event.*;
import javax.swing.*;

public class PlafTest {
    public static void main (String [] args) {
        PlafFrame frame = new PlafFrame();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}

@SuppressWarnings("serial")
class PlafFrame extends JFrame {
    private JPanel panel;
    public PlafFrame() {
        setTitle("PlafTest");
        setSize(500, 500);
        
        panel = new JPanel();

        UIManager.LookAndFeelInfo[] infos = UIManager.getInstalledLookAndFeels();
        for (UIManager.LookAndFeelInfo info : infos) {
            makeButton(info.getName(), info.getClassName());
        }

        add(panel, BorderLayout.SOUTH);
    }

    private void makeButton(String name, final String plafName) {
        JButton button = new JButton(name);
        button.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                try {
                    UIManager.setLookAndFeel(plafName);
                    SwingUtilities.updateComponentTreeUI(PlafFrame.this);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        });
        panel.add(button);
    }
}
