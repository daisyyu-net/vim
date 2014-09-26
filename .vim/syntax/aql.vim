" Vim syntax file
" Language:	Asterix Query Language
" Filenames:	*.aql

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

syn case match

syn	keyword	aqlStatement and as ascending at by declare div else end every external for function group idiv if in let mod or order return satisfies slidingwindow some stable start then tumblingwindow where with

highlight def link	aqlStatement	Statement


"floating point number, with dot, optional exponent
syn match	cFloat		"\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match	cFloat		"\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match	cFloat		"\d\+e[-+]\=\d\+[fl]\=\>"
syn match	cNumber		"0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match	cNumber		 "\<\d\+\>"
highlight def link	cNumber	Number
highlight def link	cFloat	Number

" syntax match	aqlVariable	"$\w\+"
syntax match	aqlVariable	+$\<[a-zA-Z:_][-.0-9a-zA-Z0-9:_]*\>+
highlight def link	aqlVariable	Identifier

syntax match	aqlSeparator	",\|;"
highlight link	aqlSeparator	Operator

syn region	aqlCode	transparent contained start='{' excludenl end='}' contains=aqlStatement,cNumber,aqlVariable keepend extend

syn region	List	transparent start='\[' excludenl end='\]' contains=aqlStatement,aqlVariable,cNumber  keepend extend

syn region	Bag     transparent start='<' excludenl end='>' contains=aqlStatement,aqlVariable,cNumber  keepend extend

syn region  aqlComment		 start="/\*"  end="\*/"

highlight def link aqlComment Comment
