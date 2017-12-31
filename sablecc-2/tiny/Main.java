package tiny;

import tiny.parser.*;
import tiny.lexer.*;
import tiny.node.*;
import java.io.*;

class Main
{
	public static void main(String args[])
	{
		try {
			System.out.println("Enter a \"TinyLang\" expression followed by Ctrl-d:");
			Parser p = new Parser(new Lexer(new PushbackReader(new InputStreamReader(System.in), 1024)));

			Start tree = p.parse();
			System.out.print("\nEvaluation: " + tree + "= " + Evaluator.eval(tree) + "\n");
		} 
		catch (Exception e)
		{
			System.out.println("ERROR: " + e.getLocalizedMessage());
			System.exit(1);
		}
	}
}
