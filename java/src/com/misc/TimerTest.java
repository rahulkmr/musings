package com.misc;

import java.awt.*;
import java.awt.event.*;
import java.util.*;
import javax.swing.*;
import javax.swing.Timer;

import static java.lang.System.out;

public class TimerTest {
    public static void main(String[] args) {
        Timer t = new Timer(1000, new ActionListener() {
            public void actionPerformed(ActionEvent event) {
                Date now = new Date();
                out.println("The time is " + now);
            }
        });
        t.start();

        JOptionPane.showMessageDialog(null, "Quit Program?");
        System.exit(0);
    }
}
