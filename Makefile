.PHONY: test clean watch

clean: 
	rm *.js

test-wrap.js: test-wrap.lisp
	sibilant test-wrap.lisp -o .

test: test-wrap.js
	tap -R spec test-wrap.js

watch: test-wrap.js
	nodemon --exec "make test" *.lisp