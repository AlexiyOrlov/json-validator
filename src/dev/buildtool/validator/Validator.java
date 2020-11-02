package dev.buildtool.validator;

import dev.buildtool.json.Json5Parser;
import dev.buildtool.json.Json5SyntaxError;

public class Validator {
    public static void main(String[] strings)
    {
        Json5Parser json5Parser=new Json5Parser(strings[0]);
        try {
            json5Parser.parse();
        } catch (Json5SyntaxError json5SyntaxError) {
            json5SyntaxError.printStackTrace();
        }
    }
}
