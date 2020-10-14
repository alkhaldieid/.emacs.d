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
(display-battery-mode t)

;; Misc stuff
(fset 'yes-or-no-p 'y-or-n-p)
(setenv "HOME" "/home/alkhaldieid/")
(server-start)

;; show paranthasis
(show-paren-mode 1)
;;set the default font"
;;(set-default-font "Ubuntu Mono-25")
(global-visual-line-mode t)

(use-package powerline-evil
  :ensure t)
(powerline-evil-vim-theme)
(powerline-evil-vim-color-theme)
(use-package evil-commentary
  :ensure t)
(evil-commentary-mode)

(use-package dracula-theme
   :config
   (load-theme 'dracula t)
   :ensure t)


(global-hl-line-mode t) ;; This highlights the current line in the buffer

(use-package beacon ;; This applies a beacon effect to the highlighted line
   :ensure t
   :config
   (beacon-mode 1))

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

(use-package eyebrowse
  :diminish eyebrowse-mode
  :config (progn
            (define-key eyebrowse-mode-map (kbd "C-w j") 'eyebrowse-switch-to-window-config-1)
            (define-key eyebrowse-mode-map (kbd "C-w k") 'eyebrowse-switch-to-window-config-2)
            (define-key eyebrowse-mode-map (kbd "C-w l") 'eyebrowse-switch-to-window-config-3)
            (define-key eyebrowse-mode-map (kbd "C-w ;") 'eyebrowse-switch-to-window-config-4)
            (eyebrowse-mode t)
            (setq eyebrowse-new-workspace t)))

;; set the leader key
(evil-leader/set-leader "<SPC>")
;; use (evil-leader/set-key to bind keys in the leader map

(evil-leader/set-key
 "ff" 'find-file
 "d"'(lambda() (interactive) (find-file "~/Dropbox/second"))
 ;; buffers

 "bb" 'switch-to-buffer
 "bk" 'kill-buffer
 "bp" 'previous-buffer
 "bn" 'next-buffer
 ;; files
 ;; cf files
 "cfe" '(lambda() (interactive) (find-file "~/.emacs.d/init.el"))
 "cfi" '(lambda() (interactive) (find-file "~/.config/i3/config"))
 "cfa" '(lambda() (interactive) (find-file "~/.config/aliasrc"))
 "cfd" '(lambda() (interactive) (find-file "~/.config/directories"))
 "cfk" '(lambda() (interactive) (find-file "~/.emacs.d/userConfig/keybindings.el"))
 ;; zoom-in and out
 "=" 'text-scale-increase
 "-" 'text-scale-decrease
 ;; org roam
 "nl" 'org-roam
 "nf" 'org-roam-find-file
 "ng" 'org-roam-show-graph
 "ni" 'org-roam-insert
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

      ;; (add-to-list 'org-capture-templates
      ;;             '("P" "Protocol" entry ; key, name, type
      ;;               (file+headline +org-capture-notes-file "Inbox") ; target
      ;;               "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?"
      ;;               :prepend t ; properties
      ;;               :kill-buffer t))
      ;; (add-to-list 'org-capture-templates
      ;;             '("L" "Protocol Link" entry
      ;;               (file+headline +org-capture-notes-file "Inbox")
      ;;               "* %? [[%:link][%(transform-square-brackets-to-round-ones \"%:description\")]]\n"
      ;;               :prepend t
      ;;               :kill-buffer t))
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
  (setq org-agenda-files (list org_notes))
                           ;; (concat agenda_dir "/personal.org")
                           ;; (concat agenda_dir "/coding.org")
                           ;; )
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
