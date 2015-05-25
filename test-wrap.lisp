;; Imports
(var tap (require "tap"))

;; Constants
(var NOTFOUND -1) ; for use with String.indexOf

(def wrap-at (column string)
	(if-else 
		(= string "") 
			"" 
		(< column string.length) 
			(+ (string.substr 0 column) "\n" (string.substr column))
		string))

(def find-last-space (s)
	(var string (s.trimRight))
	(var space (string.indexOf " "))
	(if (= space NOTFOUND)
		[string ""]
		[(string.substr 0 space) (string.substr (+ 1 space))]))


(tap.test "A space hunter" (lambda (suite)
	(suite.plan 4)
	(suite.test "when given an empty string" (lambda (t)
		(t.plan 1)
		(t.same (find-last-space "") ["" ""] 
			"should return an empty string")))
	(suite.test "when given a string with no spaces" (lambda (t)
		(t.plan 1)
		(t.same (find-last-space "lolcat") ["lolcat" ""]
			"should return the same string")))
	(suite.test "when given two words" (lambda (t)
		(t.plan 1)
		(t.same (find-last-space "lol cat") ["lol" "cat"]
			"should return the two words as strings")))
	(suite.test "when given a string with trailing whitespace" (lambda (t)
		(t.plan 1)
		(t.same (find-last-space "lol  ") ["lol" ""]
			"should return the same string with no trailing spaces")))
))

(tap.test "A line wrapper" (lambda (suite)
	(suite.plan 3)
	(suite.test "should not wrap an empty string" (lambda (t)
		(t.plan 1)
		(t.equal (wrap-at 10 "") "" "got an empty string")
	))
	(suite.test "should not wrap a short word" (lambda (t)
		(t.plan 1)		
		(t.equal (wrap-at 10 "otter") "otter" "got back the word unchanged")
	))
	(suite.test "should wrap run on text with no spaces" (lambda (t)
		(t.plan 2)
		(t.equal (wrap-at 3 "lollol") "lol\nlol" "wrapped after lol")
		(t.equal (wrap-at 4 "boldcat") "bold\ncat" "wrapped after bold")))))
