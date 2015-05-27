.PHONY: test clean watch

clean: 
	rm *.js

test-wrap.js: test-wrap.lisp
	sibilant test-wrap.lisp -o .

word.js: word.lisp
	sibilant word.lisp -o .

test: test-wrap.js word.js
	tap -R spec test-wrap.js

watch: test-wrap.js word.js
	nodemon --exec "make test" *.lisp