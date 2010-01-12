(defun game-start (max)
  (game-loop (random max)))

(defun game-loop (answer)
  (loop until (game-check-answer answer (game-guess))))

(defun game-guess ()  
    (parse-integer (game-read-input)))

(defun game-check-answer (answer guess)
  (cond
    ((= answer guess)
     (print-dwim "You win"))
    ((< answer guess)
     (print-dwim "Too high"))
    ((> answer guess)
     (print-dwim "Too low")))
  (= answer guess))

(defun game-read-input ()
  (format *query-io* "Your guess?: ")
  (force-output *query-io*)
  (read-line *query-io*))

(defun print-dwim (x)
  (princ x)
  (terpri))