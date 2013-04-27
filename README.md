# Excel.cf

LBNF Grammar for parsing Microsoft Excel formulas.

## Requirments

* BNFC http://bnfc.digitalgrammars.com

## Example

```
$ bnfc -m Excel.cf
$ make
$ echo "=SUM(A1:A10)" | ./TestExcel

Parse Successful!

[Abstract Syntax]

FEqual (EFun (FunctionName "SUM") [ERange (ECell (Cell "A1")) (ECell (Cell "A10"))])

[Linearized tree]

= SUM (A1 : A10)
```

## Missing features

* Union and intersection infix operators.
* Arrays.
* Error values.
* Numbers in scientific notation.
* Probably a lot more.
