/*
 * This source file was generated by the Gradle 'init' task
 */
package org.example;

import org.graalvm.polyglot.*;

public class App {
    public String getGreeting() {
        return "Hello World!";
    }

    public static void main(String[] args) {
        try (var context = Context.create()) {
            System.out.println(context.eval("python", "'Hello Python!'").asString());
        }
    }
}
