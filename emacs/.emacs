(load-file "~/.emacs.d/init/common.el")

;; System specific loads
(if (string= system-name "charliea.chi.corp.google.com")
    (load-file "~/.emacs.d/init/google.el")
    (load-file "~/.emacs.d/init/other.el"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-safe-themes (quote ("bb6b64bfb2f63efed8dea1ca03691c07c851a8be6f21675fe4909289d68975d9" "b42cf9ee9e59c3aec585fff1ce35acf50259d8b59f3047e57df0fa38516aa335" "6e03b7f86fcca5ce4e63cda5cd0da592973e30b5c5edf198eddf51db7a12b832" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
