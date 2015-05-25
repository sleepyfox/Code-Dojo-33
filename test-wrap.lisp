;; Imports
(var tap (require "tap"))
(var word (require "./word"))

(tap.test "A space hunter" (lambda (suite)
	(suite.plan 5)
	(suite.test "when given an empty string" (lambda (t)
		(t.plan 1)
		(t.same (word.find-last-space "") ["" ""] 
			"should return an empty string")))

	(suite.test "when given a string with no spaces" (lambda (t)
		(t.plan 1)
		(t.same (word.find-last-space "lolcat") ["lolcat" ""]
			"should return the same string")))

	(suite.test "when given two words" (lambda (t)
		(t.plan 1)
		(t.same (word.find-last-space "lol cat") ["lol" "cat"]
			"should return the two words as strings")))
	
	(suite.test "when given a string with trailing whitespace" (lambda (t)
		(t.plan 1)
		(t.same (word.find-last-space "lol  ") ["lol" ""]
			"should return the same string with no trailing spaces")))
	
	(suite.test "when given a string with leading whitespace" (lambda	(t)
		(t.plan 1)
		(t.same (word.find-last-space "  lol") ["lol" ""]
			"should return the same string with no leading whitespace")))))


(tap.test "A line wrapper" (lambda (suite)
	(suite.plan 4)
	(suite.test "when given an empty string" (lambda (t)
		(t.plan 1)
		(t.equal (word.wrap-at 10 "") "" 
			"should return the empty string")))

	(suite.test "when given a short word" (lambda (t)
		(t.plan 1)		
		(t.equal (word.wrap-at 10 "otter") "otter" 
			"should return the same word")))

	(suite.test "when given run-on text with no spaces" (lambda (t)
		(t.plan 2)
		(t.equal (word.wrap-at 3 "lollol") "lol\nlol" 
			"should wrap at the column count")
		(t.equal (word.wrap-at 4 "boldcat") "bold\ncat" 
			"should wrap at the column count on a longer string")))
	
	(suite.test "when given a string of words" (lambda (t)
		(t.plan 1)
		(t.equal (word.wrap-at 5 "cat dog") "cat\ndog"
			"should split at the space")))))
