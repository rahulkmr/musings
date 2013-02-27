package com.misc;

import java.lang.reflect.Method;

public class PointerTest {

    public static void main(String[] args) throws Exception {
        Method sqr = PointerTest.class.getMethod("sqr", double.class);
        System.out.println((Double) sqr.invoke(null, 10));
    }

    public static double sqr(double x) {
        return x * x;
    }
}
