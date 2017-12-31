# TinyLang

TinyLang is a simple expression language designed to introduce students to scanning and parsing tools. It supports integer literals, identifiers, binary operations (+-\*/) and parentheticals. Example expressions supported by TinyLang:
```
1+2
1-2
2*3
6/3
1+2-3
1+2*3
1-2+3
2/2-3
3*(2+2)
1+2-(3-4)
2*3+(2/2)
2-(2+4)/2
2*(2+4)-1
2*(2+4)/2
```

TinyLang also implements a basic evaluation engine for computing the result. Note that evaluation is not supported in the presence of identifiers.

We provide 3 sample implementations of the scanner and paser:
* flex+bison
* SableCC 2
* SableCC 3 (CST to AST conversion)

flex+bison works by default on the SOCS Trottier machines, whereas SableCC requires following the setup instructions [here]( https://github.com/comp520/SableCC)
