package com.misc;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

public class InvokeScriptFunction {
    /**
     * Constructs a new instance.
     */
    public InvokeScriptFunction() {
    }

    public static void main(String[] args) throws Exception {
        ScriptEngineManager manager = new ScriptEngineManager();
        ScriptEngine engine = manager.getEngineByName("JavaScript");

        String script = "var hello = function() { print('hello js'); };";
        engine.eval(script);

        Invocable inv = (Invocable)engine;
        inv.invokeFunction("hello");
    }
}
