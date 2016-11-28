;;; orgconfig.el --- my configuration of org-mode
;;; Commentary:
;; Strangely i needed to download http://orgmode.org/w/?p=org-mode.git;a=blob_plain;f=contrib/lisp/org-checklist.el;hb=HEAD
;; It is strange because the customization of org-modules propose org-checklist.
;; Searching : C-pC-t and then choose
;; +work-boss+PRIORITY="A"+Coffee="unlimited"+Effort<2         \
;;              +With={Sarah\|Denny}+SCHEDULED>="<2008-10-11>"

;;; Code:
(provide 'orgconfig)

(setq org-log-done 'time)
(require 'org-checklist)
(require 'french-holidays)
(setq calendar-holidays holiday-french-holidays)

(setq calendar-week-start-day 1
          calendar-day-name-array ["Dimanche" "Lundi" "Mardi" "Mercredi"
                                   "Jeudi" "Vendredi" "Samedi"]
          calendar-month-name-array ["Janvier" "Février" "Mars" "Avril" "Mai"
                                     "Juin" "Juillet" "Août" "Septembre"
                                        "Octobre" "Novembre" "Décembre"])
(setq org-agenda-custom-commands ())

;; use org-agenda-filter-by-tag (/) to filter more than that
(add-to-list 'org-agenda-custom-commands
             '("p" "important tasks"
               tags "PRIORITY=\"A\"/TODO"))

(add-to-list 'org-agenda-custom-commands
             '("t" "todo tasks (without schedule)"
               tags "-SCHEDULED={.}-DEADLINE={.}+ponctuel/TODO"))

(add-to-list 'org-agenda-custom-commands
             '("w" "periodic tasks without schedule"
               tags "-SCHEDULED={.}-DEADLINE={.}+périodique/TODO"))

(provide 'orgconfig.el)
;;; orgconfig.el ends here
