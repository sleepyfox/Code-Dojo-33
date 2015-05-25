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

; (def head (l) (get l 0))
; (def tail (l) (l.substr 1)) ; assuming l to be a string

(def find-last-space (s)
	(var string (chain (s.trimRight) (trimLeft)))
	(var space (string.indexOf " "))
	(if (= space NOTFOUND)
		[string ""]
		[(string.substr 0 space) (string.substr (+ 1 space))]))


(tap.test "A space hunter" (lambda (suite)
	(suite.plan 5)
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
	(suite.test "when given a string with leading whitespace" (lambda	(t)
		(t.plan 1)
		(t.same (find-last-space "  lol") ["lol" ""]
			"should return the same string with no leading whitespace")))
))

(tap.test "A line wrapper" (lambda (suite)
	(suite.plan 3)
	(suite.test "when given an empty string" (lambda (t)
		(t.plan 1)
		(t.equal (wrap-at 10 "") "" 
			"should return the empty string")
	))
	(suite.test "when given a short word" (lambda (t)
		(t.plan 1)		
		(t.equal (wrap-at 10 "otter") "otter" 
			"should return the same word")
	))
	(suite.test "when given run-on text with no spaces" (lambda (t)
		(t.plan 2)
		(t.equal (wrap-at 3 "lollol") "lol\nlol" 
			"should wrap at the column count")
		(t.equal (wrap-at 4 "boldcat") "bold\ncat" 
			"should wrap at the column count")))
	(suite.test "when given a string of words" (lambda (t)
		(t.plan 1)
		(t.equal (wrap-at 5 "cat dog") "cat\ndog"
			"should split at the space")))
))
