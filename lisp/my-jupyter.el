;;; my-jupyter.el --- start a jupyter server
;;; Commentary:
;; Nothing special

;;; Code:

;; (add-hook 'ein:notebooklist-first-open-hook
;;  (lambda ()
;;    ;; (ein:notebooklist-open-notebook-by-name "calc")
;;    ;; (ein:notebook-open "localhost:8888" "calc.ipynb" "sagemath")
;;    (ein:notebooklist-open-notebook-global "localhost:8888/calc.ipynb")
;;    ;; (ein:notebooklist-open-file "localhost:8888" "calc.ipynb")
;;    (sleep-for 2)
;;    (switch-to-buffer "*ein: localhost:8888/calc.ipynb*")
;;    (rename-buffer "calc")
;;    )
;;  )


(defun my-jupyter()
  (interactive)
  (ein:jupyter-server-start "/usr/bin/jupyter" "/home/dionisos/projets/programmation/notebooks/")
  )



(fset 'math
   [?\C-s ?c ?a ?l ?c ?\C-m ?\C-a ?\M-r ?\M-r ?\C-m ?\C-\M-x ?\( ?s ?l ?e ?e ?p ?- ?f ?\C-i ?  ?1 ?\) ?\C-m ?\M-x ?r ?a ?\C-? ?e ?n ?a ?m ?e ?\C-i ?b ?\C-i ?\C-m ?m ?a ?t ?h ?\C-m ?\C-\M-x ?\( ?s ?l ?e ?e ?p ?- ?f ?\C-i ?  ?1 ?\) ?\C-m f1])



;; (lambda () (ein:notebooklist-open-notebook-by-name "sage_calculator"))
(provide 'my-jupyter.el)
;;; my-jupyter.el ends here
