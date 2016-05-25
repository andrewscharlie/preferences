(load-file "~/.emacs.d/init/common.el")

;; System specific loads
(if (string= system-name "charliea.arb.corp.google.com")
    (load-file "~/.emacs.d/init/google.el")
    (load-file "~/.emacs.d/init/other.el"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(ido-enable-last-directory-history nil)
 '(ido-max-work-directory-list 0)
 '(ido-max-work-file-list 0)
 '(ido-record-commands nil)
 '(org-agenda-custom-commands
   (quote
    (("w" "Today - work"
      ((agenda ""
               ((org-agenda-ndays 1)
                (org-agenda-tag-filter-preset
                 (quote
                  ("+WORK")))))))
     ("p" "Today - personal"
      ((agenda ""
               ((org-agenda-ndays 1)
                (org-agenda-tag-filter-preset
                 (quote
                  ("+PERSONAL")))))))
     ("u" "Unscheduled" tags "-SCHEDULED={.+}-DEADLINE={.+}/!+TODO|+STARTED|+WAITING"))))
 '(org-agenda-dim-blocked-tasks t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-sorting-strategy (quote (time-up priority-down)))
 '(org-capture-templates
   (quote
    (("p" "personal" entry
      (file+olp "~/Dropbox/org/todo.org" "PERSONAL" "TASKS")
      "* TODO %?
")
     ("w" "work" entry
      (file+olp "~/Dropbox/org/todo.org" "WORK" "TASKS")
      "* TODO %?
"))))
 '(org-directory "~/Dropbox/org")
 '(org-log-done t)
 '(org-outline-path-complete-in-steps nil)
 '(org-refile-targets
   (quote
    (("~/Dropbox/org/todo.org" :maxlevel . 3)
     ("~/Dropbox/org/someday.org" :level . 3))))
 '(org-refile-use-outline-path (quote file))
 '(safe-local-variable-values
   (quote
    ((define-auto-insert ".cc" "chromium_header.tmpl")
     (chromium-c++minor-mode)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
