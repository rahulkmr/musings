package com.misc;

import com.misc.Pair;

public class PairTest {
    public static void main(String [] args) {
        Pair<String> p = new Pair<String>("hello", "world");
        System.out.printf("%s %s", p.getFirst(), p.getSecond());
    }
}
