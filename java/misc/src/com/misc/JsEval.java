package com.misc;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

public class JsEval {
    public static void main(String[] args) throws Exception {
        ScriptEngineManager factory = new ScriptEngineManager();
        ScriptEngine engine = factory.getEngineByName("JavaScript");
        engine.eval(new java.io.FileReader(args[0]));
    }
}
