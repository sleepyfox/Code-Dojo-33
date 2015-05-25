(var tap (require "tap"))

(def wrap-at (column string)
	(if (= string "") 
		"" 
		(if (> column string.length) 
			string
			(+ (string.substr 0 column) "\n" (string.substr column)))))

(tap.test "A line wrapper" (lambda (suite)
	(suite.test "should not wrap an empty string" (lambda (t)
		(t.plan 1)
		(t.equal (wrap-at 10 "") "" "got an empty string")
		(t.end)
	))
	(suite.test "should not wrap a short word" (lambda (t)
		(t.plan 1)		
		(t.equal (wrap-at 10 "otter") "otter" "got back the word unchanged")
		(t.end)))
	(suite.test "should wrap run on text with no spaces" (#(t)
		(t.plan 2)
		(t.equal (wrap-at 3 "lollol") "lol\nlol" "wrapped after lol")
		(t.equal (wrap-at 4 "boldcat") "bold\ncat" "wrapped after bold")
		(t.end)))))
