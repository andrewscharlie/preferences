;; Load this file when emacs starts
(find-file "~/.emacs.d/init/common.el")
(find-file "~/.emacs.d/help/org.md")

;; package allows for easy package management
;; Required here because this is what allows requiring of other packages.
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; Change the default font
(set-face-attribute 'default nil :height 110)

;; Create a thin scroll bar for every window
(scroll-bar-mode 1)
(set-scroll-bar-mode 'right)
;;(setq-default scroll-bar-width 10)

(menu-bar-mode -1)
(tool-bar-mode -1)

(setq-default indent-tabs-mode nil)

;; Disable annoying things
(setq visible-bell t)
(setq enable-recursive-minibuffers t)
(setq vc-follow-symlinks t)
(setq create-lockfiles nil)

;; Makes path be the same as in my shell
(exec-path-from-shell-initialize)

;; Always use filesystem versions of files
(global-auto-revert-mode 1)

;; Load the solarized theme
;; Don't change the font for some headings and titles
(setq solarized-use-variable-pitch nil)
;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)
;; Don't change size of org-mode headlines (but keep other size-changes)
(setq solarized-scale-org-headlines nil)
;; Avoid all font-size changes
(setq solarized-height-minus-1 1)
(setq solarized-height-plus-1 1)
(setq solarized-height-plus-2 1)
(setq solarized-height-plus-3 1)
(setq solarized-height-plus-4 1)
(load-theme 'solarized-dark t)

;; Set the default fill column to 80.
(setq-default fill-column 80)

;; Required here to allow chord bindings throughout the file
(require 'key-chord)
(key-chord-mode 1)

(global-set-key "\C-m" 'newline-and-indent)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c r") 'recompile)
(global-set-key (kbd "C-c e") 'eval-region)
(global-set-key (kbd "C-c E") 'eval-buffer)
(global-set-key (kbd "C-c C-r") 'replace-string)
(global-set-key (kbd "C-c C-/") 'replace-regexp)
(global-set-key [f5] 'revert-buffer)

;; When you have to do a split (switch-file-other-buffer), always
;; split vertically and use the split window that you already have
(setq split-width-threshold 1000)
(setq split-height-threshold nil)

;; Default to 80 column fill for C++
(add-hook 'c-mode-common-hook (lambda ()
				;; Set the fill column to 80
				(customize-set-variable 'fill-column 80)
				;; Enable auto newline mode and hungry deletions
				(c-toggle-hungry-state 1)
				(c-toggle-electric-state)))

;; diminish keeps the modeline tidy.
;; Required here to let other modes diminish themselves.
(require 'diminish)

;; anzu shows total search results in the mode line while searching
(require 'anzu)
(global-anzu-mode +1)
(diminish 'anzu-mode)

;; auto-insert provides skeletons for new buffers
(setq auto-insert-directory "~/.emacs.d/templates")

;; coffee-mode provides support for coffeescript
(require 'coffee-mode)
(custom-set-variables '(coffee-tab-width 2))

;; company mode provides an auto-complete framework
(require 'company)
(global-set-key (kbd "M-/") 'company-complete)
(setq company-minimum-prefix-length 0)
(setq company-show-numbers t)
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .01)                        ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking

;; company-go provides auto-completion for go code
(require 'company-go)
(add-hook 'go-mode-hook (lambda ()
			  (set (make-local-variable 'company-backends) '(company-go))
			  (company-mode)))

;; erc is an emacs mode for IRC
(setq erc-prompt-for-password nil)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#chromium")))

(require 'find-things-fast)
(key-chord-define-global "qf" 'ftf-find-file)
(setq ftf-filetypes (cons "*.html" ftf-filetypes))

;; flx-ido provides better flex matching for IDO
(require 'flx-ido)

;; flycheck shows errors as you go
(require 'flycheck)
(add-hook 'coffee-mode-hook (lambda ()
                              (flycheck-mode)))
(add-hook 'python-mode-hook (lambda ()
                              (flycheck-mode)))
(setq flycheck-display-errors-delay 0.01)

;; go-autocomplete provides autocomplete for go
;(require 'go-autocomplete)
;(require 'auto-complete-config)
;(add-hook 'before-save-hook 'gofmt-before-save) ;; automatically format before saving

;; go-flymake provides syntax checking for go
;(add-to-list 'load-path "~/go/src/github.com/dougm/goflymake")
					;(require 'go-flymake)

;; Make gdb run in many-windows move, similar to how Eclipse works
(setq gdb-many-windows 1)

(require 'go-mode)
(setq gofmt-command "goimports")
(add-hook 'go-mode-hook (lambda()
                          (add-hook 'before-save-hook 'gofmt-before-save)
                          (setq tab-width 2
                                whitespace-style '())))

;; hl-line+ highlights the current line when emacs is idle
(require 'hl-line+)
(toggle-hl-line-when-idle 1)

;; Don't use ido's history, because it gets in the way more than it helps
(custom-set-variables
 '(ido-enable-last-directory-history nil)
 '(ido-record-commands nil)
 '(ido-max-work-directory-list 0)
 '(ido-max-work-file-list 0))

;; ido-mode gives you nice minibuffer completion
(require 'ido)
(ido-mode 1)
(setq ido-use-faces nil)
(setq ido-auto-merge-work-directories-length -1) ; allow me to create files, dammit
(setq ido-enable-tramp-completion nil) ; ido over tramp = slow

;; Display ido results vertically, rather than horizontally
(setq ido-decorations '("\n-> " "" "\n   " "\n   ..."
                        "[" "]" " [No match]" " [Matched]"
                        " [Not readable]" " [Too big]" " [Confirm]"))

;; Make sure that ido doesn't truncate lines
(defun ido-disable-line-trucation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)

;; flx-ido adds fuzzy completion for ido-mode
(flx-ido-mode 1)

;; js2-mode fixes javascript in emacs
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))
(custom-set-variables
 '(js2-basic-offset 2)
 '(js2-idle-timer-delay 1))
(add-hook 'js2-mode-hook 'company-mode)

;; ac-js2-mode provides contextual autocomplete for javascript
;; NOTE: included here because of js2-mode dependency
(require 'ac-js2)
(setq ac-js2-evaluate-calls t)
(add-to-list 'company-backends 'ac-js2-company)

;; markdown-mode gives an emacs mode for markdown
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README.md\\'" . gfm-mode))

;; org-mode helps you organize your life
(require 'org)
(find-file "~/Dropbox/org/todo.org")

(setq org-agenda-files '("~/Dropbox/org/todo.org"))
(define-key global-map "\C-ca" 'org-agenda)
(key-chord-define-global "qc" 'org-capture)
(custom-set-variables
 '(org-directory "~/Dropbox/org")
 '(org-refile-targets (quote (("~/Dropbox/org/todo.org" :maxlevel . 3)
                              ("~/Dropbox/org/someday.org" :level . 3))))
 '(org-log-done t)
 '(org-agenda-dim-blocked-tasks t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-sorting-strategy (quote ((agenda time-up priority-down tag-up) (todo tag-up))))
 '(org-capture-templates
   (quote (("p" "personal" entry (file+olp "~/Dropbox/org/todo.org" "PERSONAL" "TASKS") "* TODO %?\n")
	   ("w" "work" entry (file+olp "~/Dropbox/org/todo.org" "WORK" "TASKS") "* TODO %?\n"))))
 '(org-agenda-sorting-strategy '(time-up priority-down))
 '(org-agenda-custom-commands
   '(("w" "Today - work"
      ((agenda "" ((org-agenda-ndays 1)
                   (org-agenda-tag-filter-preset '("+WORK"))))))
     ("p" "Today - personal"
      ((agenda "" ((org-agenda-ndays 1)
                   (org-agenda-tag-filter-preset '("+PERSONAL"))))))
     ("u" "Unscheduled" tags "-SCHEDULED={.+}-DEADLINE={.+}/!+TODO|+STARTED|+WAITING")))
 '(org-outline-path-complete-in-steps nil)
 '(org-refile-use-outline-path 'file))
(setq org-completion-use-ido t)
(add-hook 'org-agenda-mode-hook (lambda()
                                  (local-set-key (kbd "[") 'org-agenda-do-date-earlier)
                                  (local-set-key (kbd "]") 'org-agenda-do-date-later)))

(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE|+CANCELED" 'agenda))

;; show-paren-mode highlights matching parentheses
(show-paren-mode 1)
(setq show-paren-delay 0.001)

;; Provide some convenient shortcuts for merge in smerge-mode
(add-hook 'smerge-mode-hook (lambda()
			      (key-chord-define-local "qm" 'smerge-keep-mine)
			      (key-chord-define-local "qt" 'smerge-keep-other)
			      (key-chord-define-local "qn" 'smerge-next)
			      (key-chord-define-local "qp" 'smerge-prev)))

;; subword-mode makes it so that camelcase is treated properly
(global-subword-mode 1)

;; tramp allows you to locally edit remote files
(require 'tramp)
(setq tramp-default-method "ssh")

;; whitespace highlights lines that are too long
(require 'whitespace)
(setq whitespace-style '(face lines-tail))
(set-face-attribute 'whitespace-line nil
                    :background "red1"
                    :foreground "white")
(add-hook 'python-mode-hook (lambda()
                              (setq whitespace-line-column 80
                                    whitespace-style '(face tabs trailing lines-tail))))
(add-hook 'prog-mode-hook 'whitespace-mode)
(diminish 'whitespace-mode)

;; Make shift-arrow keys move between buffers
(windmove-default-keybindings)

;; ws-butler cleans up whitespace, but only on lines that you touch
(require 'ws-butler)
(ws-butler-global-mode 1)
(diminish 'ws-butler-mode)

;; yasnippet provides template for frequently-used idioms
(require 'yasnippet)
(yas-global-mode)
;; Don't use the default snippets
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(key-chord-define-global "qo" 'yas-expand-from-trigger-key)
;; Tell yasnippet not to mess with the spacing
(setq yas-indent-line 'none)

(diminish 'yas-minor-mode)

(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;; ;; C++ tools for coding in Chromium
(load-file "~/.emacs.d/init/chromium.el")

(defun search-forward-point-at-beginning (term)
  (if (search-forward term)
      (backward-char (length term))))

(defun search-backward-point-at-end (term)
  (if (search-backward term)
      (forward-char (length term))))

;; Enable js2-mode editing between the nearest <script> tags.
(defun js2-edit-enable ()
  (interactive)
  (save-excursion
    (search-backward-point-at-end "<script>")
    (set-mark-command nil)
    (search-forward-point-at-beginning "</script>")
    (narrow-to-region (region-beginning) (region-end))
    (js2-mode)))

;; Disable js2-mode editing and return to html-mode.
(defun js2-edit-disable ()
  (interactive)
  (widen)
  (html-mode))

(add-hook 'html-mode-hook (lambda()
                            (key-chord-define-local "qe" 'js2-edit-enable)))
(add-hook 'js2-mode-hook (lambda()
                            (key-chord-define-local "qe" 'js2-edit-disable)))

;; Playground
(add-to-list 'load-path "~/.emacs.d/playground")
(add-to-list 'load-path "~/.emacs.d/vendor")
