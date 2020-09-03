;; (setq initial-buffer-choice "~/Dropbox/index.org")

;; Hide Scroll bar,menu bar, tool bar
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode    -1)
(menu-bar-mode -1)

;; Line numbering
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; Display battery for when in full screen mode 
;; Uncomment in laptops
(display-battery-mode t)

;; Misc stuff
(fset 'yes-or-no-p 'y-or-n-p)
(setenv "HOME" "/home/alkhaldieid/")
(server-start)

(setq initial-scratch-message "Welcome Abu-Saad") ; print a default message in the empty scratch buffer opened at startup
;; show paranthasis
(show-paren-mode 1)
;;set the default font"
(set-default-font "Ubuntu Mono-25")
(global-visual-line-mode t)


(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq delete-old-versions -1 )
(setq inhibit-startup-screen t )
;; Remove initial buffer, set index file
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore )
(setq coding-system-for-read 'utf-8 )
(setq coding-system-for-write 'utf-8 )
(setq sentence-end-double-space nil)
(setq default-fill-column 80)
(setq initial-scratch-message "")
(setq word-wrap t)

;; https://github.com/danielmai/.emacs.d/blob/master/config.org
(defalias 'yes-or-no-p 'y-or-n-p)
(blink-cursor-mode -1)
(show-paren-mode t)

(setq-default mode-line-format nil)

;; (toggle-word-wrap)
(global-auto-revert-mode t)
(electric-pair-mode)

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (setq-default evil-escape-delay 0.2))

(use-package dracula-theme
   :config
   (load-theme 'dracula t)
   :ensure t)
   

(global-hl-line-mode t) ;; This highlights the current line in the buffer

(use-package beacon ;; This applies a beacon effect to the highlighted line
   :ensure t
   :config
   (beacon-mode 1))

(use-package org-superstar  ;; Improved version of org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

(setq org-startup-indented t)           ;; Indent according to section
(setq org-startup-with-inline-images t) ;; Display images in-buffer by default

(use-package evil-org
  :ensure t
  :after (evil org)
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme '(navigation insert textobjects additional calendar))))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(setq org-agenda-custom-commands
   '(("h" "Daily habits"
      ((agenda ""))
      ((org-agenda-show-log t)
       (org-agenda-ndays 7)
       (org-agenda-log-mode-items '(state))
       (org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp ":DAILY:"))))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(setq
 org_roam_dir (concat (getenv "HOME") "org/roam/")
 bib_file (concat (getenv "HOME") "Dropbox/mend/library.bib")
 org-directory org_roam_dir
 deft-directory org_roam_dir
 org-roam-directory org_roam_dir
 org-ref-completion-library 'org-ref-ivy-cite
 org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtexy
 org-ref-default-bibliography bib_file
 org-ref-bibliography-notes "/home/alkhaldieid/org/roam/bibnotes.org"
 org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n  :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
 org-ref-notes-directory org_roam_dir
 org-ref-notes-function 'orb-edit-notes
)
(use-package deft
  :commands deft
  :init
  (setq deft-default-extension "org"
        ;; de-couples filename and note title:
        deft-use-filename-as-title nil
        deft-use-filter-string-for-filename t
        ;; disable auto-save
        deft-auto-save-interval -1.0
        ;; converts the filter string into a readable file-name using kebab-case:
        deft-file-naming-rules
        '((noslash . "-")
          (nospace . "-")
          (case-fn . downcase)))
  :config
  (add-to-list 'deft-extensions "tex")
  )
;; Helm Bibtex configs 
(setq
 bibtex-completion-notes-path "/home/alkhaldieid/org/roam/"
 bibtex-completion-bibliography "/home/alkhaldieid/Dropbox/mend/library.bib"
 bibtex-completion-pdf-field "file"
 bibtex-completion-notes-template-multiple-files
 (concat
  "#+TITLE: ${title}\n"
  "#+ROAM_KEY: cite:${=key=}\n"
  "* TODO Notes\n"
  ":PROPERTIES:\n"
  ":Custom_ID: ${=key=}\n"
  ":NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n"
  ":AUTHOR: ${author-abbrev}\n"
  ":JOURNAL: ${journaltitle}\n"
  ":DATE: ${date}\n"
  ":YEAR: ${year}\n"
  ":DOI: ${doi}\n"
  ":URL: ${url}\n"
  ":END:\n\n"
  )
 )
;; org-ref
(use-package org-ref
    :config
    (setq
         org-ref-completion-library 'org-ref-ivy-cite
         org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex
         org-ref-default-bibliography (list "/home/alkhaldieid/Dropbox/mend/library.bib")
         org-ref-bibliography-notes "/home/alkhaldieid/org/roam/bibnotes.org"
         org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
         org-ref-notes-directory "/home/alkhaldieid/org/roam/"
         org-ref-notes-function 'orb-edit-notes
    ))
;; org-roam
(use-package org-roam
  :hook (org-load . org-roam-mode)
  :commands (org-roam-buffer-toggle-display
             org-roam-find-file
             org-roam-graph
             org-roam-insert
             org-roam-switch-to-buffer
             org-roam-dailies-date
             org-roam-dailies-today
             org-roam-dailies-tomorrow
             org-roam-dailies-yesterday)
  :preface
  ;; Set this to nil so we can later detect whether the user has set a custom
  ;; directory for it, and default to `org-directory' if they haven't.
  (defvar org-roam-directory nil)
  :init
  :config
  (setq org-roam-directory (expand-file-name (or org-roam-directory "roam")
                                             org-directory)
        org-roam-verbose nil  ; https://youtu.be/fn4jIlFwuLU
        org-roam-buffer-no-delete-other-windows t ; make org-roam buffer sticky
        org-roam-completion-system 'default
)

  ;; Normally, the org-roam buffer doesn't open until you explicitly call
  ;; `org-roam'. If `+org-roam-open-buffer-on-find-file' is non-nil, the
  ;; org-roam buffer will be opened for you when you use `org-roam-find-file'
  ;; (but not `find-file', to limit the scope of this behavior).
  (add-hook 'find-file-hook
    (defun +org-roam-open-buffer-maybe-h ()
      (and +org-roam-open-buffer-on-find-file
           (memq 'org-roam-buffer--update-maybe post-command-hook)
           (not (window-parameter nil 'window-side)) ; don't proc for popups
           (not (eq 'visible (org-roam-buffer--visibility)))
           (with-current-buffer (window-buffer)
             (org-roam-buffer--get-create)))))

  ;; Hide the mode line in the org-roam buffer, since it serves no purpose. This
  ;; makes it easier to distinguish among other org buffers.
  (add-hook 'org-roam-buffer-prepare-hook #'hide-mode-line-mode))


;; Since the org module lazy loads org-protocol (waits until an org URL is
;; detected), we can safely chain `org-roam-protocol' to it.
(use-package org-roam-protocol
  :after org-protocol)


(use-package company-org-roam
  :after org-roam
  :config
  (set-company-backend! 'org-mode '(company-org-roam company-yasnippet company-dabbrev)))

;; org-roam-bibtex
(use-package org-roam-bibtex
  :after (org-roam)
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config
  (setq org-roam-bibtex-preformat-keywords
   '("=key=" "title" "url" "file" "author-or-editor" "keywords"))
  (setq orb-templates
        '(("r" "ref" plain (function org-roam-capture--get-point)
           ""
           :file-name "${slug}"
           :head "#+TITLE: ${=key=}: ${title}\n#+ROAM_KEY: ${ref}

- tags ::
- keywords :: ${keywords}

\n* ${title}\n  :PROPERTIES:\n  :Custom_ID: ${=key=}\n  :URL: ${url}\n  :AUTHOR: ${author-or-editor}\n  :NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n  :NOTER_PAGE: \n  :END:\n\n"

           :unnarrowed t))))
;; org-noter
(use-package org-noter
  :after (:any org pdf-view)
  :config
  (setq
   ;; The WM can handle splits
   org-noter-notes-window-location 'other-frame
   ;; Please stop opening frames
   org-noter-always-create-frame nil
   ;; I want to see the whole file
   org-noter-hide-other nil
   ;; Everything is relative to the main notes file
   org-noter-notes-search-path (list org_roam_dir)
   )
  )

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config 
    (setq which-key-idle-delay 0.3)
    (setq which-key-popup-type 'frame)
    (which-key-mode)
    (which-key-setup-minibuffer)
    (set-face-attribute 'which-key-local-map-description-face nil 
       :weight 'bold)
  )

(use-package helm
  :init
    (require 'helm-config)
    (setq helm-split-window-in-side-p t
          helm-move-to-line-cycle-in-source t)
  :config 
    (helm-mode 1) ;; Most of Emacs prompts become helm-enabled
    (helm-autoresize-mode 1) ;; Helm resizes according to the number of candidates
    (global-set-key (kbd "C-x b") 'helm-buffers-list) ;; List buffers ( Emacs way )
    (define-key evil-ex-map "b" 'helm-buffers-list) ;; List buffers ( Vim way )
    (global-set-key (kbd "C-x r b") 'helm-bookmarks) ;; Bookmarks menu
    (global-set-key (kbd "C-x C-f") 'helm-find-files) ;; Finding files with Helm
    (global-set-key (kbd "M-c") 'helm-calcul-expression) ;; Use Helm for calculations
    (global-set-key (kbd "C-s") 'helm-occur)  ;; Replaces the default isearch keybinding
    (global-set-key (kbd "C-h a") 'helm-apropos)  ;; Helmized apropos interface
    (global-set-key (kbd "M-x") 'helm-M-x)  ;; Improved M-x menu
    (global-set-key (kbd "M-y") 'helm-show-kill-ring)  ;; Show kill ring, pick something to paste
  :ensure t)

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (global-company-mode)
)


(use-package company-quickhelp
  :after (company)
  :hook (company-mode . company-quickhelp-mode)
  :config
    (setq company-quickhelp-delay 0.5)
  :ensure t)

(use-package magit
  :ensure t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package elpy
  :ensure t
  :config
  (elpy-enable))

(use-package auto-complete
  :ensure t
  :config 
  (ac-config-default)
)

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))
(yas-reload-all)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package multi-term
  :ensure t
  :init
  (setq multi-term-program "/bin/zsh"))

;; Ivy & friends
(use-package ivy
  :ensure t)
(use-package counsel
  :ensure t)

;; Ranger
(use-package ranger
  :ensure t
  :init
  (setq ranger-show-hidden t))

;; Code commenting
(use-package evil-nerd-commenter :ensure t)

;; Project management
(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'alien)
  (setq projectile-sort-order 'recently-active)

  ; Route errors to /dev/null
  (setq projectile-git-submodule-command "git submodule --quiet foreach 'echo $path' 2>/dev/null | tr '\\n' '\\0'")
  :config
  (projectile-mode))
(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode))

;; Workspaces
(use-package perspective
  :ensure t
  :config
  (persp-mode))
(use-package persp-projectile
  :ensure t)

;; Surround
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "Kj" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "KJ" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "kJ" 'evil-normal-state))
(use-package general
  :ensure t
  :config
  (general-define-key
   "M-x" 'counsel-M-x)
  (general-define-key
   :states '(normal visual)
   "C-u" 'scroll-down-command
   "C-d" 'scroll-up-command)
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
   "'"   'multi-term
   "/"   'counsel-rg
   ":"   'counsel-M-x
   "."   'edit-emacs-configuration
   "\""  'split-window-below
   "%"  'split-window-right
   "TAB" 'toggle-buffers

   "p" 'projectile-command-map
   "pp" 'projectile-persp-switch-project
   "pf" 'counsel-projectile-find-file

   "b" '(:ignore t :which-key "Buffers")
   "bb"  'ivy-switch-buffer
   "bp" 'previous-buffer
   "bn" 'next-buffer

   "w" '(:ignore t :which-key "Window")
   "wl"  'windmove-right
   "wh"  'windmove-left
   "wk"  'windmove-up
   "wj"  'windmove-down
   "ws"  'split-window-below
   "wv"  'split-window-right
   "wd"  'delete-window

   "l" '(:ignore t :which-key "Workspaces")
   "l1" 'eyebrowse-switch-to-window-config-1
   "l2" 'eyebrowse-switch-to-window-config-2
   "l3" 'eyebrowse-switch-to-window-config-3
   "l4" 'eyebrowse-switch-to-window-config-4

 
   "a" '(:ignore t :which-key "Applications")
   "ar" 'ranger
   "ad" 'deer

   "s" '(:ignore t :which-key "Search")
   "sc" 'evil-ex-nohighlight
   "sl" 'ivy-resume

   "t" '(:ignore t :which-key "Toggles")
   "tn" 'display-line-numbers-mode
   "tl" 'toggle-truncate-lines

   "T" 'counsel-load-theme

   "x" '(:ignore t :which-key "Text")
   "xl" '(:ignore t :which-key "Lines")
   "xls" 'sort-lines

   "g" '(:ignore t :which-key "Code?")
   "gc" 'evilnc-comment-or-uncomment-lines

   "d" '(:ignore t :which-key "Comments")
   "df" 'js-doc-insert-function-doc
   "dm" 'js-doc-insert-file-doc
   )
  (general-define-key
   :states '(visual)
   "gc" 'evilnc-comment-or-uncomment-lines))

(use-package paredit
  :ensure t)
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(define-skeleton latex-skeleton
"Skeleton for article type latex documents"
"Preamble:"
"\\documentclass{article}\n"
"\\usepackage[utf8]{inputenc}\n"
"\\usepackage[margin=1 in]{geometry}\n"
"\\usepackage{graphicx}\n"
"\\setlength{\\parindent}{4em}\n"
"\\setlength{\\parskip}{1em}\n"
"\\renewcommand{\\baselinestretch}{1.5}\n\n"
"\\author{Matheus Augusto da Silva}\n"
"\\title{"_"}\n"
"\\date{\\today}\n\n"
"\\begin{document}\n"
"\\maketitle\n\n"
"\\end{document}\n")

(define-skeleton org-latex-summary
"Skeleton for summaries "
"Preamble:"
"#+LATEX_CLASS: article\n"
"#+LATEX_CLASS_OPTIONS: [a5paper,landscape,fourcolumn]\n"
"#+LATEX_COMPILER: lualatex\n"
"#+LATEX_HEADER: \\input{/home/trajanus/Documents/LaTeX/summaryheader.tex}\n"
"#+STARTUP: showeverything\n"
"#+OPTIONS: toc:nil\n"
"\\begin{multicols*}{4}\n"
"* "_"\n"
"\\end{multicols*}\n")

(define-skeleton org-latex-article
"Skeleton for articles "
"Preamble:"
"#+STARTUP: showeverything\n"
"#+TITLE: TITLE\n"
"#+AUTHOR: Matheus Augusto da Silva\n"
"#+DATE: \\today\n"
"#+LATEX_CLASS: article\n"
"#+LATEX_CLASS_OPTIONS: [a4paper]\n"
"#+LATEX_HEADER: \\input{/home/trajanus/Documents/LaTeX/articleheader.tex}\n"
"#+STARTUP: showeverything\n"
"#+OPTIONS: toc:nil\n")

(define-skeleton org-wiki-entry
"Skeleton for articles "
"Preamble:"
"#+STARTUP: showeverything\n"
"#+TITLE: "_"\n"
"#+AUTHOR: Matheus Augusto da Silva\n"
"#+STARTUP: showeverything\n"
"\n"
"* Index")

(define-skeleton org-wiki-index
"Skeleton for articles "
"Preamble:"
"#+STARTUP: showeverything\n"
"#+TITLE: "_"\n"
"#+AUTHOR: Matheus Augusto da Silva\n"
"#+STARTUP: showeverything\n"
"\n"
"* Index\n"
"\n"
"** Summaries\n"
"[[./summaries/summaries.org][Summaries]]"
)

;; This requires SDCV 
 ;; This little function looks in a stardict file for words that look like
 ;; the word under the cursor. I use it when correcting my spelling in french
(defun dict-search ()
  (interactive)
  (add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
  (shell-command (format "export STARDICT_DATA_DIR=/home/trajanus/Documents/Stardict ;sdcv %s | head -5" (thing-at-point 'word))))

(define-key evil-normal-state-map (kbd "ç") 'ispell-word)
(define-key evil-normal-state-map (kbd "Ç") 'dict-search)

(use-package eyebrowse
  :diminish eyebrowse-mode
  :config (progn
            (define-key eyebrowse-mode-map (kbd "C-w j") 'eyebrowse-switch-to-window-config-1)
            (define-key eyebrowse-mode-map (kbd "C-w k") 'eyebrowse-switch-to-window-config-2)
            (define-key eyebrowse-mode-map (kbd "C-w l") 'eyebrowse-switch-to-window-config-3)
            (define-key eyebrowse-mode-map (kbd "C-w ;") 'eyebrowse-switch-to-window-config-4)
            (eyebrowse-mode t)
            (setq eyebrowse-new-workspace t)))
