package com.misc;

import java.awt.geom.*;

import javax.swing.JComponent;

public class Ball {
    private static final int XSIZE = 15, YSIZE = 15;
    private double x = 0, y = 0, dx = 1, dy =1;
    private JComponent component;
    private Rectangle2D bounds;

    public Ball(JComponent component) {
        this.component = component;
        this.bounds = component.getBounds();
    }

    public void move() {
        x += dx;
        y += dy;
        if (x < bounds.getMinX()) {
            x = bounds.getMinX();
            dx = -dx;
        }
        if (x + XSIZE >= bounds.getMaxX()) {
            x = bounds.getMaxX() - XSIZE;
            dx = -dx;
        }
        if (y < bounds.getMinY()) {
            y = bounds.getMinY();
            dy = -dy;
        }
        if (y + YSIZE >= bounds.getMaxY()) {
            y = bounds.getMaxY() - YSIZE;
            dy = -dy;
        }
        component.repaint();
    }

    public Ellipse2D getShape() {
        return new Ellipse2D.Double(x, y, XSIZE, YSIZE);
    }
}
