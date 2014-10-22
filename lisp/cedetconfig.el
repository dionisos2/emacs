;; (ede-cpp-root-project
;;  "MonSuperProjet"
;;  :name "Mon Super Projet"
;;  :file "~/source/monsuperprojet/CMakeLists.txt"
;;  :include-path '("/usr/include/c++/4.4"))

(require 'cedet)
(require 'semantic)
(require 'srecode)
(global-ede-mode 1)

;; (require 'semantic-ia)
;; (require 'semantic-gcc)
;; (require 'semanticdb)
;; (global-ede-mode 1)
;; ;; (semantic-load-enable-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)
;; (global-semanticdb-minor-mode 1)
;; (semantic-add-system-include "/usr/include/c++/4.4/" 'c++-mode)

;; (require 'semanticdb-global)
;; (semanticdb-enable-gnu-global-databases 'c-mode)
;; (semanticdb-enable-gnu-global-databases 'c++-mode)

;; (add-to-list 'semantic-lex-c-preprocessor-symbol-map '("Q_GUI_EXPORT" . ""))
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-map '("Q_CORE_EXPORT" . ""))
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-map '("Q_OBJECT" . ""))
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-map '("slots" . ""))

;; (setq qt4-base-dir "/usr/include/qt4")
;; (setq qt4-gui-dir (concat qt4-base-dir "/QtGui"))
;; (setq qt4-core-dir (concat qt4-base-dir "/QtCore"))
;; (setq qt4-qt-dir (concat qt4-base-dir "/Qt"))
;; (semantic-add-system-include qt4-base-dir 'c++-mode)
;; (semantic-add-system-include qt4-gui-dir 'c++-mode)
;; (semantic-add-system-include qt4-core-dir 'c++-mode)
;; (semantic-add-system-include qt4-qt-dir 'c++-mode)

;; (add-to-list 'auto-mode-alist (cons qt4-base-dir 'c++-mode))
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig.h"))
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig-large.h"))
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qglobal.h"))

(srecode-minor-mode 1)
(add-to-list 'srecode-map-load-path "~/.emacs.d/template")


;; ;;Permet de limiter l'analyse de code au fichier courant ou au projet courant.
;; ;;Rajouter "unloaded system recursive" pour tout parser (beaucoup plus long !)
;; ;;(setq-mode-local c-mode semanticdb-find-default-throttle '(file local project))
;; ;;(setq-mode-local c++-mode semanticdb-find-default-throttle '(file local project))
