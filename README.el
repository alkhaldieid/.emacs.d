;; Remove initial buffer, set index file
(setq inhibit-startup-message t)
;; (setq initial-buffer-choice "~/Dropbox/index.org")

;; Hide Scroll bar,menu bar, tool bar
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Line numbering
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; Display battery for when in full screen mode
;; Uncomment in laptops
(display-battery-mode -1)

;; Misc stuff
(fset 'yes-or-no-p 'y-or-n-p)
(setenv "HOME" "/home/alkhaldieid/")
(server-start)

;; show paranthasis
(show-paren-mode 1)
;;set the default font"
;;(set-default-font "Ubuntu Mono-25")
(global-visual-line-mode t)

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

(use-package org-projectile
:ensure t)       
(setq org-agenda-custom-commands
   '(("h" "Daily habits"
      ((agenda ""))
      ((org-agenda-show-log t)
       (org-agenda-ndays 7)
       (org-agenda-log-mode-items '(state))
       (org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp ":DAILY:"))))))
(setq org-todo-keywords
    (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
            (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING" "TBC(b)"))))

(setq org-todo-keyword-faces
    (quote (("TODO" :foreground "red" :weight bold)
            ("NEXT" :foreground "blue" :weight bold)
            ("DONE" :foreground "forest green" :weight bold)
            ("TBC" :foreground "forest green" :weight bold)
            ("WAITING" :foreground "orange" :weight bold)
            ("HOLD" :foreground "magenta" :weight bold)
            ("CANCELLED" :foreground "forest green" :weight bold)
            ("email" :foreground "forest green" :weight bold)
            ("PHONE" :foreground "forest green" :weight bold))))
(setq org-use-fast-todo-selection t)

;; capturing templates
(setq org-capture-templates
    '(("n" "New Idea" entry (file "~/Dropbox/org/agenda/newpaperideas.org")
        "* %? :IDEA: \n%t" :clock-in t :clock-resume t)
    ("f" "Fancy" entry (file "~/Dropbox/org/roam/20201017010543-fancy.org")
        "* %? :fancy: \n%t" :clock-in nil :clock-resume nil)
    ("p" "research" entry (file "~/Dropbox/org/agenda/research.org")
        "* %? :research:todo: \n%t" :clock-in nil :clock-resume nil)
    ("a" "alias" entry (file "~/.config/aliasrc")
        "* %? \n" )
    ("c" "coding goal" entry (file "~/Dropbox/org/agenda/coding.org")
        "* %? :goal: \n%t" :clock-in nil :clock-resume nil)
    ("t" "TODO item" entry (file "~/Dropbox/org/agenda/TODOs.org")
        "* %? :goal: \n%t" :clock-in nil :clock-resume nil)
    ("r" "to be refiled" entry (file "~/Dropbox/org/agenda/refile.org")
        "* %? :misc: \n%t" :clock-in nil :clock-resume nil)))
(global-set-key (kbd "<f5>") 'org-capture)
(global-set-key (kbd "<f12>") 'org-agenda)


;; The following setting is different from the document so that you
;; can override the document org-agenda-files by setting your
;; org-agenda-files in the variable org-user-agenda-files
;;
(if (boundp 'org-user-agenda-files)
    (setq org-agenda-files org-user-agenda-files)
(setq org-agenda-files (quote ("~/Dropbox/org/roam/daily"
                                "~/Dropbox/org/agenda/"
                                ))))

(with-eval-after-load 'org-agenda
(require 'org-projectile)
(mapcar #'(lambda (file)
            (when (file-exists-p file)
                (push file org-agenda-files)))
        (org-projectile-todo-files)))

(require 'ob-ipython)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (ipython . t)
   (lisp . t)))

;; disables the automatic indentation inside an orgmode source block when invoking evil-org-open-below with <normal-state> o
(setq org-src-tab-acts-natively nil)

(use-package powerline-evil
  :ensure t)
(powerline-evil-vim-theme)
(powerline-evil-vim-color-theme)
(use-package evil-commentary
  :ensure t)
(evil-commentary-mode)

(global-hl-line-mode t) ;; This highlights the current line in the buffer
  (use-package beacon ;; This applies a beacon effect to the highlighted line
     :ensure t
     :config
     (beacon-mode 1))
;; a bunch of nice themes

  (use-package dracula-theme :ensure t)
  (use-package parchment-theme :ensure t)
  (use-package cloud-theme :ensure t)
  (use-package moe-theme :ensure t)
  (use-package zenburn-theme :ensure t)
  (use-package monokai-theme :ensure t)
  (use-package gruvbox-theme :ensure t)
  (use-package ample-theme :ensure t)
  (use-package ample-zen-theme :ensure t)
  (use-package alect-themes :ensure t)
  (use-package tao-theme :ensure t)
  (use-package poet-theme :ensure t)
  (use-package modus-operandi-theme :ensure t)
  (use-package modus-vivendi-theme :ensure t)
  (use-package faff-theme :ensure t)
  (use-package color-theme-modern :ensure t)

  (load-theme 'modus-vivendi t)

(use-package try
  :ensure t)

(use-package which-key
  :config
    (setq which-key-idle-delay 0.3)
    (setq which-key-popup-type 'frame)
    (which-key-mode)
    (which-key-setup-minibuffer)
    (set-face-attribute 'which-key-local-map-description-face nil
       :weight 'bold)
  :ensure t)

(use-package ivy
:ensure t
:diminish (ivy-mode)
:bind (("C-x b" . ivy-switch-buffer))
:config
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "%d/%d ")
(setq ivy-display-style 'fancy))

(use-package counsel
:ensure t
:bind
(("M-y" . counsel-yank-pop)
    :map ivy-minibuffer-map
    ("M-y" . ivy-next-line)))



(use-package swiper
:ensure t
:bind (("C-s" . swiper-isearch)
        ("C-r" . swiper-isearch)
        ("C-c C-r" . ivy-resume)
        ("M-x" . counsel-M-x)
        ("C-x C-f" . counsel-find-file))
:config
(progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") 'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs              (if (executable-find "python") 3 0)
          treemacs-deferred-git-apply-delay   0.5
          treemacs-display-in-side-window     t
          treemacs-file-event-delay           5000
          treemacs-file-follow-delay          0.2
          treemacs-follow-after-init          t
          treemacs-follow-recenter-distance   0.1
          treemacs-git-command-pipe           ""
          treemacs-goto-tag-strategy          'refetch-index
          treemacs-indentation                2
          treemacs-indentation-string         " "
          treemacs-is-never-other-window      nil
          treemacs-max-git-entries            5000
          treemacs-no-png-images              nil
          treemacs-no-delete-other-windows    t
          treemacs-project-follow-cleanup     nil
          treemacs-persist-file               (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-recenter-after-file-follow nil
          treemacs-recenter-after-tag-follow  nil
          treemacs-show-cursor                nil
          treemacs-show-hidden-files          nil
          treemacs-silent-filewatch           nil
          treemacs-silent-refresh             nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-space-between-root-nodes   t
          treemacs-tag-follow-cleanup         t
          treemacs-tag-follow-delay           1.5
          treemacs-width                      35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package magit
  :ensure t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package auto-complete
  :ensure t
  :config
  (ac-config-default)
)

(use-package evil-nerd-commenter
  :ensure t
)

(use-package pyvenv
    :ensure t)

(use-package python-mode)

(use-package elpy
  :ensure t
  :config
  (elpy-enable))
  (add-hook 'elpy-mode-hook 'flycheck-mode)

(use-package py-autopep8)
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopop8-enable-on-save)  
(use-package company-jedi)
(add-to-list 'company-backends 'company-jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(use-package company
  :ensure t
  :config
  (global-company-mode))
  
(use-package company-quickhelp
  :after (company)
  :hook (company-mode . company-quickhelp-mode)
  :config
    (setq company-quickhelp-delay 0.5)
  :ensure t)

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package eyebrowse
  :diminish eyebrowse-mode
  :config (progn
            (define-key eyebrowse-mode-map (kbd "C-w j") 'eyebrowse-switch-to-window-config-1)
            (define-key eyebrowse-mode-map (kbd "C-w k") 'eyebrowse-switch-to-window-config-2)
            (define-key eyebrowse-mode-map (kbd "C-w l") 'eyebrowse-switch-to-window-config-3)
            (define-key eyebrowse-mode-map (kbd "C-w ;") 'eyebrowse-switch-to-window-config-4)
            (eyebrowse-mode t)
            (setq eyebrowse-new-workspace t)))

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
"#+AUTHOR: Eid Alkhaldi\n"
"#+DATE: \\today\n"
"#+LATEX_CLASS: article\n"
"#+LATEX_CLASS_OPTIONS: [a4paper]\n"
"#+LATEX_HEADER: \\input{/home/alkhaldieid/Dropbox/LaTeX/articleheader.tex}\n"
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
(use-package unicode-fonts :ensure t)
(defun dict-search ()
  (interactive)
  (add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
  (shell-command (format "export STARDICT_DATA_DIR=/home/alkhaldieid/Documents/Stardict ;sdcv -0  %s | sed -n 6p" (thing-at-point 'word))))

(define-key evil-normal-state-map (kbd "t") 'ispell-word)
(define-key evil-normal-state-map (kbd "T") 'dict-search)

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

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;; open with configs;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (openwith-mode t)
  (setq openwith-associations '(("\\.pdf\\'" "zathura" (file))
                                ("\\.mp4\\'" "mpv" (file))
                                ))

(use-package openwith :ensure t)

(setq
 org_notes (concat (getenv "HOME") "Dropbox/org/roam/")
 zot_bib (concat (getenv "HOME") "Dropbox/mend/library.bib")
 org-directory org_notes
 deft-directory org_notes
 org-roam-directory org_notes
 )
(require 'org-ref)

(setq
      org-ref-completion-library 'org-ref-ivy-cite
      org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtexy
      org-ref-default-bibliography (list "/home/alkhaldieid/Dropbox/mend/library.bib")
      org-ref-bibliography-notes "/home/alkhaldieid/Dropbox/org/roam/bibnotes.org"
      org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n  :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
      org-ref-notes-directory "/home/alkhaldieid/Dropbox/org/roam/"
      org-ref-notes-function 'orb-edit-notes
)
;;;;;;;;;;; Spacemacs configs;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; NOTE TAKING CONFIGS ;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq
   dropbox_dir (concat (getenv "HOME") "/Dropbox")
   org_notes (concat dropbox_dir "/org/roam/")
   zot_bib (concat dropbox_dir "/mend/library.bib")
   org-directory org_notes
   deft-directory org_notes
   org-roam-directory org_notes
   agenda_dir (concat dropbox_dir "/org/agenda")
)
(with-eval-after-load 'org
    (setq
    bibtex-completion-notes-path org_notes
    bibtex-completion-bibliography zot_bib
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
      "* Why am I reading this article?\n"
      "* Problem Definition\n"
      "* Proposed Method\n"
      "* Dataset used\n"

     )
  )
)
;;;;;;;;;;;; ORG NOTER ;;;;;;;;;;;;;;;;;;;;;;;;;

(with-eval-after-load 'org
   (setq
            org-ref-completion-library 'org-ref-ivy-cite
            org-ref-get-pdf-filename-function 'org-ref-get-mendeley-filename
            org-ref-default-bibliography (list zot_bib)
            org-ref-bibliography-files (list zot_bib)
            org-ref-bibliography-notes (concat org_notes  "/bibnotes.org")
            org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n  :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
            org-ref-notes-directory org_notes
            org-ref-notes-function 'orb-edit-notes
        )
      (setq
            org-noter-default-notes-file-name '(concat dropbox_dir "/notes.org")
            org-noter-default-search-path  '(concat dropbox_dir "/mend"))

  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; LaTex Configurations;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; org settings

  (setq user-full-name "Eid Alkhaldi")
  (require 'ox)
  (require 'ox-latex)

  (setq org-latex-pdf-process '("%latex -interaction nonstopmode -output-directory %o %f" "%latex -interaction nonstopmode -output-directory %o %f" "latex -interaction nonstopmode -output-directory %o %f" ))
  (setq org-latex-create-formula-image-program 'dvipng)
  (org-babel-do-load-languages 'org-babel-load-languages '((latex . t)))
  (with-eval-after-load 'org-agenda
    (require 'org-projectile)
    (mapcar #'(lambda (file)
                (when (file-exists-p file)
                  (push file org-agenda-files)))
            (org-projectile-todo-files)))
  (global-company-mode)
  (menu-bar-mode 1)
  (global-visual-line-mode t)
  ;(add-to-list 'deft-extensions "tex")
   ;;; enables the live-preview of compiled pdfs
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  (org-babel-do-load-languages 'org-babel-load-languages '((python . t)))
;;;;; form
  (with-eval-after-load 'org
      (add-to-list 'org-latex-classes
                  '("apa6"
                    "\\documentclass{apa6}"
                    ("\\section{%s}" . "\\section*{%s}")
                    ("\\subsection{%s}" . "\\subsection*{%s}")
                    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                    ("\\paragraph{%s}" . "\\paragraph*{%s}")
                    ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
      (setq org-latex-pdf-process
            '("latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f %f")))


;;;;;;;;;;;;;;;;;;;;;;;;;; My functions ;;;;;;;;;;;;;;;;;;
  (defun my-org-screenshot ()
    "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
    (interactive)
    (setq filename
          (concat
           (make-temp-name
            (concat (buffer-file-name)
                    "_"
                    (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
    (call-process "import" nil nil nil filename)
    (insert (concat "[[" filename "]]"))
    (org-display-inline-images))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; Organizational stuff ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; following this guy
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING" "TBC(b)"))))

  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "red" :weight bold)
                ("NEXT" :foreground "blue" :weight bold)
                ("DONE" :foreground "forest green" :weight bold)
                ("TBC" :foreground "forest green" :weight bold)
                ("WAITING" :foreground "orange" :weight bold)
                ("HOLD" :foreground "magenta" :weight bold)
                ("CANCELLED" :foreground "forest green" :weight bold)
                ("MEETING" :foreground "forest green" :weight bold)
                ("PHONE" :foreground "forest green" :weight bold))))
  (setq org-use-fast-todo-selection t)

  ;; capturing templates
  (setq org-capture-templates
        '(("n" "New Idea" entry (file "~/Dropbox/org/agenda/newpaperideas.org")
           "* %? :IDEA: \n%t" :clock-in t :clock-resume t)
           ))



  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;; Apperance ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq evil-emacs-state-cursor '("chartreuse3" (box)))
  (setq-default evil-insert-state-cursor 'box)

  (setq org-startup-folded "folded")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; company confiuration ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq company-minimum-prefix-length 3
       company-idle-delay 0.05)
;;;;;;;;;;;;;

; https://cestlaz.github.io/posts/using-emacs-24-capture-2/
; Bind Key to: emacsclient -ne "(make-capture-frame)"

(defadvice org-capture-finalize 
    (after delete-capture-frame activate)
  "Advise capture-finalize to close the frame"
  (if (equal "capture" (frame-parameter nil 'name))
      (delete-frame)))

(defadvice org-capture-destroy
    (after delete-capture-frame activate)
  "Advise capture-destroy to close the frame"
  (if (equal "capture" (frame-parameter nil 'name))
      (delete-frame)))

(use-package noflet
   :ensure t )
(defun make-capture-frame ()
  "Create a new frame and run org-capture."
  (interactive)
  (make-frame '((name . "capture")))
  (select-frame-by-name "capture")
  (delete-other-windows)
  (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
          (org-capture)))

(add-to-list 'load-path "~/repos/org-reveal/")

   
(setq org-reveal-root "file:///home/alkhaldieid/repos/reveal.js")



;; set the leader key
(evil-leader/set-leader "<SPC>")
;; use (evil-leader/set-key to bind keys in the leader map

(evil-leader/set-key
 "<SPC> " 'counsel-M-x
 "fs" 'save-buffer
 "ff" 'counsel-find-file


 "d"'(lambda() (interactive) (find-file "~/Dropbox/second_final/ieee"))
 ;; buffers

 "bb" 'switch-to-buffer
 "bk" 'kill-buffer
 "bp" 'previous-buffer
 "bn" 'next-buffer
 ;; windows
 "wl" 'evil-window-right
 "wh" 'evil-window-left
 "wk" 'evil-window-up
 "wj" 'evil-window-down
 "wd" 'evil-window-delete
 "wv" 'evil-window-vsplit
 "ws" 'evil-window-split
 "wm" 'delete-other-windows

 ;; workspaces
 "lw1" 'eyebrowse-switch-to-window-config-1
 "lw2" 'eyebrowse-switch-to-window-config-2
 "lw3" 'eyebrowse-switch-to-window-config-3
 "lw4" 'eyebrowse-switch-to-window-config-4
 "lw5" 'eyebrowse-switch-to-window-config-5
 "lw6" 'eyebrowse-switch-to-window-config-6
 "lw7" 'eyebrowse-switch-to-window-config-7
 "lw8" 'eyebrowse-switch-to-window-config-8
 "lw9" 'eyebrowse-switch-to-window-config-9
 ;; files
 ;; cf files
 "cfe" '(lambda() (interactive) (find-file "~/.emacs.d/init.el"))
 "cfi" '(lambda() (interactive) (find-file "~/.config/i3/config"))
 "cfa" '(lambda() (interactive) (find-file "~/.config/aliasrc"))
 "cfd" '(lambda() (interactive) (find-file "~/.config/directories"))
 "cfk" '(lambda() (interactive) (find-file "~/.emacs.d/userConfig/keybindings.el"))
 "cfm" '(lambda() (interactive) (find-file "~/.emacs.d/myinit.org"))

 ;; evil-nerd-commenter
 "ci" 'evilnc-comment-or-uncomment-lines
 "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
 "cc" 'evilnc-copy-and-comment-lines
 "cp" 'evilnc-comment-or-uncomment-paragraphs
 "cr" 'comment-or-uncomment-region
 "cv" 'evilnc-toggle-invert-comment-line-by-line
 "."  'evilnc-copy-and-comment-operator
 "//" 'evilnc-comment-operator ; if you prefer backslash key

 ;; zoom-in and out
 "=" 'text-scale-increase
 "-" 'text-scale-decrease

 ;; org roam
 "nl" 'org-roam
 "nf" 'org-roam-find-file
 "ng" 'org-roam-show-graph
 "ni" 'org-roam-insert
 "nt" 'org-roam-dailies-find-today
 ;; org-roam-bibtex
 "na" 'orb-note-actions
 ;; syn layer  keybindings
 "ss" 'synonyms
 "sl" 'synosaurus-lookup
 "sr" 'synosaurus-choose-and-replace
 "si" 'synosaurus-choose-and-insert
 ;; org-recoll keys
 "ps" 'org-recoll-search
 "pu" 'org-recoll-update-index
 ;; evil-commentry
;; ";" evil-commentry-line
 )
