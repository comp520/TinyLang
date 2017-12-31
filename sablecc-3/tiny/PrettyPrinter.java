package tiny;

import tiny.parser.*;
import tiny.lexer.*;
import tiny.node.*;
import tiny.analysis.*;
import java.util.*;

public class PrettyPrinter extends DepthFirstAdapter
{
	public static void print(Node node)
	{
		node.apply(new PrettyPrinter());
	}

	private void puts(String s)
	{
		System.out.print(s);
		System.out.flush();
	}

	public void caseAPlusExp(APlusExp node)
	{
		puts("(");
		node.getL().apply(this);
		puts("+");
		node.getR().apply(this);
		puts(")");
	}

	public void caseAMinusExp(AMinusExp node)
	{
		puts("(");
		node.getL().apply(this);
		puts("-");
		node.getR().apply(this);
		puts(")");
	}

	public void caseAMultExp(AMultExp node)
	{	
		puts("(");
		node.getL().apply(this);
		puts("*");
		node.getR().apply(this);
		puts(")");
	}

	public void caseADivdExp(ADivdExp node)
	{
		puts("(");
		node.getL().apply(this);
		puts("/");
		node.getR().apply(this);
		puts(")");
	}

	public void caseAIdExp(AIdExp node)
	{
		puts(node.getId().getText());
	}

	public void outANumberExp(ANumberExp node)
	{
		puts(node.getNumber().getText());
	}
}
