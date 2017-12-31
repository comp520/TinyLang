package tiny;

import tiny.parser.*;
import tiny.lexer.*;
import tiny.node.*;
import tiny.analysis.*;
import java.util.*;

public class Evaluator extends DepthFirstAdapter
{
	public static int eval(Node ast)
	{
		Evaluator e = new Evaluator();
		ast.apply(e);
		return e.getValue(ast);
	}

	// Hashtable, holding intermediate values for AST nodes
	private Hashtable<Node, Integer> values = new Hashtable<Node, Integer>();

	// Utility methods to set/get values for AST nodes
	private void setValue(Node node, int value)
	{
		values.put(node, new Integer(value));
	}

	// Gets and removes the associated value from the values hashtable. This
	// reduces memory pressure, but you should replace "remove" with "get" if
	// you intend to lookup the same value more than once (e.g.: interpreter)
	private int getValue(Node node)
	{
		Integer value = (Integer)values.remove(node);
		return value.intValue();
	}

	/* AST root (hidden [start = exp;] production) */
	public void outStart(Start node)
	{
		setValue(node, getValue(node.getPExp()));
	}

	public void outAPlusExp(APlusExp node)
	{
		setValue(node, getValue(node.getExp()) + getValue(node.getFactor()));
	}

	public void outAMinusExp(AMinusExp node)
	{
		setValue(node, getValue(node.getExp()) - getValue(node.getFactor()));
	}

	public void outAFactorExp(AFactorExp node)
	{
		setValue(node, getValue(node.getFactor()));
	}

	public void outAMultFactor(AMultFactor node)
	{
		setValue(node, getValue(node.getFactor()) * getValue(node.getTerm()));
	}

	public void outADivdFactor(ADivdFactor node)
	{
		setValue(node, getValue(node.getFactor()) / getValue(node.getTerm()));
	}

	public void outATermFactor(ATermFactor node)
	{
		setValue(node, getValue(node.getTerm()));
	}

	public void outAParenTerm(AParenTerm node)
	{
		setValue(node, getValue(node.getExp()));
	}

	public void outAIdTerm(AIdTerm node)
	{
		throw new RuntimeException("Cannot evaluate the value of an identifier");
	}

	public void outANumberTerm(ANumberTerm node)
	{
		setValue(node, Integer.parseInt(node.getNumber().getText()));
	}
}
