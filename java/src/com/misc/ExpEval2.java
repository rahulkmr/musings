package com.misc;

import java.util.Map;
import java.util.HashMap;

interface Expr2 {
    int eval(Map<String, Integer> env);
}

public class ExpEval2 {
    public static Expr2 number(final int i) {
        return new Expr2() {
            public int eval(Map<String, Integer> env) {
                return i;
            }
        };
    }

    public static Expr2 variable(final String name) {
        return new Expr2() {
            public int eval(Map<String, Integer> env) {
                return env.get(name);
            }
        };
    }

    public static Expr2 add(final Expr2 a, final Expr2 b) {
        return new Expr2() {
            public int eval(Map<String, Integer> env) {
                return a.eval(env) + b.eval(env);
            }
        };
    }

    public static Expr2 subtract(final Expr2 a, final Expr2 b) {
        return new Expr2() {
            public int eval(Map<String, Integer> env) {
                return a.eval(env) - b.eval(env);
            }
        };
    }

    public static Expr2 multiply(final Expr2 a, final Expr2 b) {
        return new Expr2() {
            public int eval(Map<String, Integer> env) {
                return a.eval(env) * b.eval(env);
            }
        };
    }

    public static Expr2 divide(final Expr2 a, final Expr2 b) {
        return new Expr2() {
            public int eval(Map<String, Integer> env) {
                return a.eval(env) / b.eval(env);
            }
        };
    }

    public static void main (String [] args) {
        HashMap<String, Integer> env =
            new HashMap<String, Integer>();
        env.put("a", 3);
        env.put("b", 5);
        env.put("c", 7);
        Expr2 exp = add(
                multiply(variable("a"), variable("b")),
                divide(number(100),
                    subtract(number(9), variable("c"))));
        System.out.println(exp.eval(env));
    }
}
