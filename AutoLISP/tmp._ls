(defun C:Hello () (prompt "Hello"))
(defun C:Hello2 () (alert "Hello2"))



(defun C:rec1 ()
    (setq point (getpoint "\n Input point:"))
	 (setq B (getreal "\n Input diametre:"))
  (setq p1m (polar point 0.0 (/ B 2.0))
	p1 (polar p1m (/ pi 2.0) (/ B 2.0))
	p2 (polar p1 pi B)
	p3 (polar p2 (- (/ pi 2)) B)
	p4 (polar p3 0.0 B)
	))
  (command "Circle" point "D" B)
 )
       