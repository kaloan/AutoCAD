(defun add10 (x) (+ x 10))

(defun C:rec1 ( / point B p1m p1 p2 p3 p4)
(setq point (getpoint "\n Input point:"))
(setq B (getreal "\n Input diameter:"))
  (setq p1m (polar point 0.0 (/ B 2.0))
	p1 (polar p1m (/ pi 2.0) (/ B 2.0))
	p2 (polar p1 pi B)
	p3 (polar p2 (- (/ pi 2.0)) B)
	p4 (polar p3 0.0 B)
	);endd setq
 (command "CIRCLE" point "D" B)
 (command "LINE" p1 p2 p3 p4 p1 "")
  );end defun


(defun C:SLOT ( / oldsnap diam )
(setvar "CMDECHO" 0)
(setvar "BLIPMODE" 0)
(setq oldsnap (getvar "OSMODE"))
(setq diam (getdist "\nSlot Diameter : ")
lngth (getdist "\nSlot Length : "))
(while
(setq pt1 (getpoint "\nInsertion point: "))
(setvar "OSMODE" 0)
(setq pt2 (polar pt1 0.0 (/ (- lngth diam) 2.0))
pt3 (polar pt2 (/ pi 2.0) (/ diam 4.0))
pt4 (polar pt3 pi (- lngth diam))
pt5 (polar pt4 (* pi 1.5) (/ diam 2.0))
pt6 (polar pt5 0.0 (- lngth diam)))
(command "PLINE" pt3 "W" (/ diam 10.0) "" pt4
"ARC" pt5 "LINE" pt6 "ARC" "CLOSE")
(setvar "OSMODE" oldsnap)
);while
(princ)
);defun
(princ)

(defun C:ISLE ()
(setvar "cmdecho" 0)
(setq pa (getpoint "\nBeginning point: ")
pb (getpoint pa "\nOrientation point: ")
)
(grdraw pa pb 1 1)
(setq pc (getpoint pa "\nRadius point: "))
(grdraw pa pb 1 1)
(setq aa (angle pa pb)
ab (+ aa (* pi 0.5))
da (distance pa pc)
p1 (polar pa ab da)
p2 (polar pa (+ ab pi) da)
p3 (polar pb ab da)
p4 (polar pb (+ ab pi) da)
)
(command "pline" p2 p4 "a" p3 "l" p1 "a" p2
"cl")
(princ)
)

;coding starts here
(defun c:barea ( / a b opp tekst)
(setq a (getpoint "\nSelect Internal Point: "))
(command "-Boundary" a "")
(setq b (entlast))
(redraw b 3)
(command "area" "O" "L")
(setq opp (rtos (getvar "area") 2 3))
(setq tekst (strcat "\nArea = " opp))
(alert tekst)
(redraw b 4)
(command "Erase" b "")
(princ)
);defun
(princ)
;coding ends here

(defun c:rtrian ( / point side1 side2 p1 p2)
  (setq point (getpoint "\n Point of right angle"))
  (setq side1 (getreal "\n XSide"))
  (setq side2 (getreal "\n YSide"))
  (setq p1 (polar point 0.0 side1)
	p2 (cond ((>= side1 0) (polar point (/ pi 2) side2))
		 (t (polar point (/ pi 2) side2))))
	
  (command "LINE" point p1 p2 "C"))

(defun myabs ( / num )
  (setq num (getreal "\n Input number"))
  (setq res (cond ((> num 0) num) (t (- num))))
  res)