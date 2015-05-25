(var tap (require "tap"))

(def wrap-at (column string)
	(if-else 
		(= string "") 
			"" 
		(< column string.length) 
			(+ (string.substr 0 column) "\n" (string.substr column))
		string))

(def find-last-space (string)
	["" ""])

(tap.test "A space hunter" (lambda (suite)
	(suite.plan 1)
	(suite.test "when given an empty string" (lambda (t)
		(t.plan 1)
		(t.same (find-last-space "") ["" ""] 
			"should return an empty string")))))

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
	(suite.test "should wrap run on text with no spaces" (#(t)
		(t.plan 2)
		(t.equal (wrap-at 3 "lollol") "lol\nlol" "wrapped after lol")
		(t.equal (wrap-at 4 "boldcat") "bold\ncat" "wrapped after bold")))))
