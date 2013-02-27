package com.misc;

import java.util.Map;
import java.util.HashMap;

interface Expr {
    int eval(Map<String, Integer> env);
}

class Number implements Expr {
    private final int x;

    Number(int x) {
        this.x = x;
    }

    @Override
    public int eval(Map<String, Integer> env) {
        return x;
    }
}

class Variable implements Expr {
    private final String name;

    Variable(String name) {
        this.name = name;
    }

    @Override
    public int eval(Map<String, Integer> env) {
        return env.get(name);
    }
}
class Add implements Expr {
    private final Expr x, y;

    Add(Expr x, Expr y) {
        this.x = x;
        this.y = y;
    }

    @Override
    public int eval(Map<String, Integer> env) {
        return x.eval(env) + y.eval(env);
    }
}

class Subtract implements Expr {
    private final Expr x, y;

    Subtract(Expr x, Expr y) {
        this.x = x;
        this.y = y;
    }

    @Override
    public int eval(Map<String, Integer> env) {
        return x.eval(env) - y.eval(env);
    }
}

class Multiply implements Expr {
    private final Expr x, y;

    Multiply(Expr x, Expr y) {
        this.x = x;
        this.y = y;
    }

    @Override
    public int eval(Map<String, Integer> env) {
        return x.eval(env) * y.eval(env);
    }
}

class Divide implements Expr {
    private final Expr x, y;

    Divide(Expr x, Expr y) {
        this.x = x;
        this.y = y;
    }

    @Override
    public int eval(Map<String, Integer> env) {
        return x.eval(env) / y.eval(env);
    }
}

public class ExpEval {
    public static void main (String [] args) {
        HashMap<String, Integer> env =
            new HashMap<String, Integer>();
        env.put("a", 3);
        env.put("b", 5);
        env.put("c", 7);
        Expr exp = new Add(
                new Multiply(new Variable("a"), new Variable("b")),
                new Divide(new Number(100),
                    new Subtract(new Number(9), new Variable("c"))));
        System.out.println(exp.eval(env));
    }
}
