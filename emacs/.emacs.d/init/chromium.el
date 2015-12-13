;; Load this file when emacs starts
(find-file "~/.emacs.d/init/chromium.el")

;; Add the Chromium's emacs plugins to the load path


;; Load the base C/C++ style for Google
(load-file "~/.emacs.d/vendor/google-c-style.el")
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; Create a modified Google style for Chromium
(c-add-style "Chromium" '("Google"))

;; Create a modified Google style for WebKit
(c-add-style "WebKit" '("Google"
                        (c-basic-offset . 4)
                        (fill-column . 120)
                        (c-offsets-alist . ((innamespace . 0)
                                            (access-label . -)
                                            (case-label . 0)
                                            (member-init-intro . +)
                                            (topmost-intro . 0)
                                            (arglist-cont-nonempty . +)))))

(add-to-list 'load-path "~/chromium/src/tools/gn/misc/emacs/")
(require 'gn-mode)

(require 'ycmd)
(require 'company-ycmd)
(require 'flycheck-ycmd)

(company-ycmd-setup)
(flycheck-ycmd-setup)

;; Show completions after 0.15 seconds
(setq company-idle-delay 0.15)

;; Replace the directory information with where you downloaded ycmd to
(set-variable 'ycmd-server-command (list "python" (substitute-in-file-name "$HOME/github/ycmd/ycmd/__main__.py")))

;; Edit according to where you have your Chromium/Blink checkout
(add-to-list 'ycmd-extra-conf-whitelist (substitute-in-file-name "$HOME/chromium/.ycm_extra_conf.py"))

;; Show flycheck errors in idle-mode as well
(setq ycmd-parse-conditions '(save new-line mode-enabled idle-change))

;; Makes emacs-ycmd less verbose
(setq url-show-status t)

;; Provide a wrapper function to always run Chromium compile commands from
;; ~/chromium/src
(defun chromium-compile ()
  (interactive)
  (let ((default-directory "~/chromium/src/"))
    (call-interactively 'compile)))

;; Define a minor mode to override the default compile keybinding so that it
;; runs chromium-compile instead
(defvar chromium-c++-minor-mode-map (make-keymap) "chromium-c++-minor-mode-keymap")
(define-key chromium-c++-minor-mode-map (kbd "C-c c") 'chromium-compile)
(define-minor-mode chromium-c++-minor-mode
  t " chromium-c++" 'chromium-c++-minor-mode-map)


;; TODO(charliea): Fix autocomplete
;; (require 'ycmd)
;; (require 'company-ycmd)


;; (company-ycm-setup)

;; (add-hook 'c++-mode-hook 'ycmd-mode)
;; (add-hook 'c++-mode-hook 'company-mode)

;; (set-variable 'ycmd-server-command (list "python" (substitute-in-file-name "$HOME/YouCompleteMe/ycmd/ycmd/__main__.py")))
;; (add-to-list 'ycmd-extra-conf-whitelist (substitute-in-file-name "$HOME/chromium/.ycm_extra_conf.py"))

;; ;; (require 'flycheck-ycmd)
;; ;; (flycheck-ycmd-setup)
;; ;; ;; (add-hook 'c++-mode-hook 'flycheck-mode)
;; ;; Show flycheck errors in idle mode as well
;; (setq ycmd-parse-conditions '(save new-line mode-enabled idle-change))
