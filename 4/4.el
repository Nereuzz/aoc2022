(defun read-lines (filePath)
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" t)))

(defun iota (count &optional start step)
    (let* ((start (if start start 0))
	   (step (if step step 1))
	   (last (+ start count))
	   (counter 0)
	   (list '())
	   (elt start))
      (while (< counter count)
	(push elt list)
	(setq elt (+ elt step))
	(setq counter (1+ counter)))
      (reverse list)))

(defun part1 ()
  (setq fest (read-lines "input.txt"))
  (setq result 0)
  (while fest
    (setq hest (pop fest))
    (setq lower1 (string-to-number (car (split-string hest "," t))))
    (setq upper1 (string-to-number (car (cdr (split-string (car (split-string hest "," t)) "-" t)))))
    (setq lower2 (string-to-number (car (split-string (car (cdr (split-string hest "," t))) "-" t))))
    (setq upper2 (string-to-number (car (cdr (split-string (car (cdr (split-string hest "," t))) "-" t)))))
    (setq first (iota (+ (- upper1 lower1) 1) lower1 1))
    (setq second (iota (+ (- upper2 lower2) 1) lower2 1))
  
    (setq test0 (cl-search first second))
    (setq test1 (cl-search second first))

    (if (or test0 test1) (setq result (+ result 1))))
  (print result))

(defun part2 ()
  (setq fest (read-lines "input.txt"))
  (setq result 0)
  (while fest
    (setq hest (pop fest))
    (setq lower1 (string-to-number (car (split-string hest "," t))))
    (setq upper1 (string-to-number (car (cdr (split-string (car (split-string hest "," t)) "-" t)))))
    (setq lower2 (string-to-number (car (split-string (car (cdr (split-string hest "," t))) "-" t))))
    (setq upper2 (string-to-number (car (cdr (split-string (car (cdr (split-string hest "," t))) "-" t)))))
    (setq first (iota (+ (- upper1 lower1) 1) lower1 1))
    (setq second (iota (+ (- upper2 lower2) 1) lower2 1))
  
    (setq test0 (cl-intersection first second))

    (if (or test0 test1) (setq result (+ result 1))))
  (print result))

(part1)
(part2)
