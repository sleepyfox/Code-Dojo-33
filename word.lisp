;; Constants
(var NOTFOUND -1) ; for use with String.indexOf

(def wrap-at (column string)
	(if-else 
		(= string "") 
			"" 
		(< column string.length) 
			(do 
				(var xs (find-last-space (string.substr 0 column)))
				(+ (get xs 0) "\n" (get xs 1) (string.substr column)))
		string))

; (def head (l) (get l 0))
; (def tail (l) (l.substr 1)) ; assuming l to be a string

(def find-last-space (s)
	(var string (chain (s.trimRight) (trimLeft)))
	(var space (string.indexOf " "))
	(if (= space NOTFOUND)
		[string ""]
		[(string.substr 0 space) (string.substr (+ 1 space))]))

(assign module.exports {
	wrap-at wrap-at
	find-last-space find-last-space
})