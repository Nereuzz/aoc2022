(defun read-lines (filePath)
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" t)))

(defun print-elements-of-list (list)
  "Print each element of LIST on a line of its own."
  (while list
    (print (car list))
    (setq list (cdr list))))


(setq fest (read-lines "small_input.txt"))
(print-elements-of-list fest)




