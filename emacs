;;; package --- Emacs settings
;;; Commentary:
(require 'package)

;;; Code:
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(menu-bar-mode -1)

(require 'evil-leader)
(evil-leader/set-leader ",")
(global-evil-leader-mode)
(evil-leader/set-key "e" 'find-file)
(evil-leader/set-key "l" 'lorcan/log-line)
;; (add-hook 'coffee-mode-hook
;;   (function (lambda ()
;;           (setq evil-shift-width 2))))

(require 'evil)
(evil-mode 1)
(define-key evil-motion-state-map "\t" nil)

;; (require 'rainbow-delimiters)
;; (global-rainbow-delimiters-mode)

;;;; Remap org-mode meta keys for convenience
;;(mapcar (lambda (state)
;;    (evil-declare-key state org-mode-map
;;      (kbd "M-l") 'org-metaright
;;      (kbd "M-h") 'org-metaleft
;;      (kbd "M-k") 'org-metaup
;;      (kbd "M-j") 'org-metadown
;;      (kbd "M-L") 'org-shiftmetaright
;;      (kbd "M-H") 'org-shiftmetaleft
;;      (kbd "M-K") 'org-shiftmetaup
;;      (kbd "M-J") 'org-shiftmetadown))
;;  '(normal insert))

(setq org-link-abbrev-alist
      '(("PR"  . "https://github.com/ServiceFrame/ServiceFrame/pull/%s")
        ("JIRA"  . "https://serviceframe.atlassian.net/browse/%s")))


(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#ffffff" "#ff9da4" "#d1f1a9" "#ffeead" "#bbdaff" "#ebbbff" "#99ffff" "#002451"))
 '(company-ghc-show-info t)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#003f8e")
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(org-agenda-files (quote ("~/org.org" "~/Dropbox/org/agenda.org")))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#ff9da4") (40 . "#ffc58f") (60 . "#ffeead") (80 . "#d1f1a9") (100 . "#99ffff") (120 . "#bbdaff") (140 . "#ebbbff") (160 . "#ff9da4") (180 . "#ffc58f") (200 . "#ffeead") (220 . "#d1f1a9") (240 . "#99ffff") (260 . "#bbdaff") (280 . "#ebbbff") (300 . "#ff9da4") (320 . "#ffc58f") (340 . "#ffeead") (360 . "#d1f1a9"))))
 '(vc-annotate-very-old-color nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(define-key global-map "\C-cc" 'org-capture)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
; (setq org-default-notes-file (concat org-directory "/Users/lorcan/Dropbox/org/general.org"))

(setq org-capture-templates
  '(("t" "Todo" entry (file+headline "/Users/lorcan/Dropbox/Apps/MobileOrg/general.org" "Tasks")
    "* TODO %?\n  %i\n  %a")
   ("c" "Journal" entry (file+datetree "/Users/lorcan/Dropbox/Apps/MobileOrg/general.org"))))

(eval-after-load "org"
  '(require 'ox-md nil t))

(setq org-refile-targets (quote ((nil :maxlevel . 9)
            (org-agenda-files :maxlevel . 9))))

(set-cursor-color "#92c48f")

;; (load "~/.emacs.d/elpa/haskell-mode-2.8.0/haskell-site-file")
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(eval-after-load 'haskell-mode
  '(evil-leader/set-key "f" 'haskell-mode-stylish-buffer))

(eval-after-load 'haskell-mode
  '(evil-leader/set-key "i" 'haskell-navigate-imports))

(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))
(eval-after-load 'haskell-cabal
  '(define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))

(setenv "PATH" (concat "~/.cabal/bin:" (getenv "PATH")))
(setenv "PATH" (concat "~/Library/Haskell/bin:" (getenv "PATH")))
(add-to-list 'exec-path "~/Library/Haskell/bin:")
(add-to-list 'exec-path "~/.cabal/bin")

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) ))

(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))

(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/Apps/MobileOrg")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/Apps/MobileOrg/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.

(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

(defun lorcan/log-line ()
  (interactive)
  (setq loggers '(("coffee" "console.log \"%s\", %s\n")
                  ("js" "console.log(\"%s\", %s)\n")
                  ("handlebars" "{{debug \"%s\" %s}}\n")
                  ("py"  "print (\"%s\", %s)\n" )
                  ("rkt"  "(display `(\"%s\" ,%s ))" )
                  ("scm"  "(display `(\"%s\" ,%s ))" )
                  ("scheme"  "(display `(\"%s\" ,%s ))" )
                  ("sh" "% (indent)secho \"% (line)s\" % (line)s\n")))

  (setq ext (file-name-extension (buffer-file-name)))

  (setq line (buffer-substring
              (line-beginning-position) (line-end-position)))

  (kill-whole-line)
  (insert (format
           (car (cdr
                 (assoc ext loggers)))
           line line)))

(global-hl-line-mode 1)
(set-face-background 'hl-line "#222222")
(set-face-foreground 'highlight nil)

(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)
(setq flycheck-sh-shellcheck-executable "shellcheck")

(require 'handlebars-mode)
;; (require 'coffee-mode)

(evil-ex-define-cmd "Explore" 'dired)

(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags
  '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
    (js-mode  "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
    (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

(set-default 'truncate-lines t)

(require 'company)
(add-hook 'haskell-mode-hook 'company-mode)

(add-to-list 'company-backends 'company-ghc)

(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)

(setq w3m-use-cookies t)

(require 'org)
(require 'org-install)
;; (require 'org-trello)
(add-to-list 'org-modules "org-habit")

(provide '.emacs)
;;; .emacs.el ends here
