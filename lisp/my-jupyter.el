;;; my-jupyter.el --- start a jupyter server
;;; Commentary:
;; Nothing special

;;; Code:

(add-hook 'ein:notebooklist-first-open-hook
 (lambda ()
   ;; (ein:notebooklist-open-notebook-by-name "sage_calculator.ipynb")
   (ein:notebooklist-open-notebook-global "localhost:8888/sage_calculator.ipynb")
   (sleep-for 10)
   (switch-to-buffer "*ein: localhost:8888/sage_calculator.ipynb*")
   (rename-buffer "calculator")
   ;; (switch-to-buffer "*ein:notebooklist http://localhost:8888*")
   ;; (rename-buffer "notebooklist")
   )
 )



(ein:jupyter-server-start "/usr/bin/jupyter" "/home/dionisos/projets/programmation/notebooks/")


;; (lambda () (ein:notebooklist-open-notebook-by-name "sage_calculator"))
(provide 'my-jupyter.el)
;;; my-jupyter.el ends here
