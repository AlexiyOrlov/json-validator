package dev.buildtool.validator;

import dev.buildtool.json.Json5Parser;
import dev.buildtool.json.Json5SyntaxError;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Validator {
    public static void main(String[] args)
    {
        if(args.length>0) {
            String directory=args[0];
            Path pathDir= Paths.get(directory);
            if(Files.isDirectory(pathDir)) {
                try {
                    Files.list(pathDir).forEach(path -> {
                        String name=path.getFileName().toString();
                        if(name.endsWith(".json") || name.endsWith(".json5")) {
                            String json = Json5Parser.readJson(pathDir, false);
                            if (json != null) {
                                try {
                                    new Json5Parser(json).parse();
                                    System.out.println("File " + path.getFileName() + " validated.");
                                } catch (Json5SyntaxError json5SyntaxError) {
                                    json5SyntaxError.printStackTrace();
                                    System.out.println("File " + path.getFileName() + " is incorrect");
                                }
                            }
                        }
                    });
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            else {
                System.out.println("Supplied argument is not a directory");
            }
        }
        else {
            System.out.println("No input present");
        }
    }
}
