package com.misc;

import java.util.Scanner;
import java.io.*;
import static java.lang.System.out;

public class ScannerTest {
    public static void main(String[] args) throws FileNotFoundException {
        Scanner in = new Scanner(new File("/home/rahul/.screenrc"));
        while (in.hasNextLine()) {
            out.println(in.nextLine());
        }
    }
}
