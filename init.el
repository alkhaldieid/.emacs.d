;; Global appearance configs"
;;disable welcome screen"

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; packages configs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; Packages Managers ;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(setq package-enable-at-startup nil)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-install 'use-package))

;(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; Evil Stuff ;;;;;;;;;;;
;; Enable evil-leader (has to be enabled before evil-mode)

(unless (package-installed-p 'evil-leader)
  (package-install 'evil-leader))
(require 'evil-leader)

;; evil-leader configs
;; (global-evil-leader-mode 1) Enable evil leader in every buffer where evil is enabled
(global-evil-leader-mode 1)


(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)


(org-babel-load-file "/home/alkhaldieid/.emacs.d/README.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline success warning error])
 '(ansi-color-names-vector
   ["gray35" "#ff8059" "#44bc44" "#eecc00" "#2fafff" "#feacd0" "#00d3d0" "gray65"])
 '(awesome-tray-mode-line-active-color "#2fafff")
 '(awesome-tray-mode-line-inactive-color "#323232")
 '(custom-safe-themes
   '("1a094b79734450a146b0c43afb6c669045d7a8a5c28bc0210aba28d36f85d86f" "cc2f32f5ee19cbd7c139fc821ec653804fcab5fcbf140723752156dc23cdb89f" "39a854967792547c704cbff8ad4f97429f77dfcf7b3b4d2a62679ecd34b608da" "24714e2cb4a9d6ec1335de295966906474fdb668429549416ed8636196cb1441" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(describe-char-unidata-list
   '(name old-name general-category canonical-combining-class bidi-class decomposition decimal-digit-value digit-value numeric-value mirrored iso-10646-comment uppercase lowercase))
 '(exwm-floating-border-color "#646464")
 '(flymake-error-bitmap '(flymake-double-exclamation-mark modus-themes-fringe-red))
 '(flymake-note-bitmap '(exclamation-mark modus-themes-fringe-cyan))
 '(flymake-warning-bitmap '(exclamation-mark modus-themes-fringe-yellow))
 '(highlight-tail-colors '(("#2f4a00" . 0) ("#00415e" . 20)))
 '(hl-todo-keyword-faces
   '(("HOLD" . "#cfdf30")
     ("TODO" . "#feacd0")
     ("NEXT" . "#b6a0ff")
     ("THEM" . "#f78fe7")
     ("PROG" . "#00d3d0")
     ("OKAY" . "#4ae8fc")
     ("DONT" . "#70c900")
     ("FAIL" . "#ff8059")
     ("BUG" . "#ff8059")
     ("DONE" . "#44bc44")
     ("NOTE" . "#f0ce43")
     ("KLUDGE" . "#eecc00")
     ("HACK" . "#eecc00")
     ("TEMP" . "#ffcccc")
     ("FIXME" . "#ff9977")
     ("XXX+" . "#f4923b")
     ("REVIEW" . "#6ae4b9")
     ("DEPRECATED" . "#bfd9ff")))
 '(ibuffer-deletion-face 'modus-themes-mark-del)
 '(ibuffer-filter-group-name-face 'modus-themes-mark-symbol)
 '(ibuffer-marked-face 'modus-themes-mark-sel)
 '(ibuffer-title-face 'modus-themes-pseudo-header)
 '(org-agenda-files
   '("~/Dropbox/org/roam/20201021141631-pytorch.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2020-12-03.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2020-12-04.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2020-12-05.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2020-12-07.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2020-12-08.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2020-12-10.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2020-12-11.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2020-12-15.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2020-12-23.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-01-05.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-01-06.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-01-07.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-01-08.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-01-11.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-01-19.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-01-25.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-01-26.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-02-02.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-02-04.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-02-06.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-02-11.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-02-15.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-02-17.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-02-22.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-02-26.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-02-27.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-03-01.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-03-02.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-03-03.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-03-04.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-03-08.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-03-18.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-03-19.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-03-24.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-03-25.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-03-26.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-03-27.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-03-31.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-04-01.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-04-06.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-04-07.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-04-12.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-04-14.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-04-19.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-04-20.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-04-22.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-04-23.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-04-25.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-04-27.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-04-29.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-05-01.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-05-02.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-05-03.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-05-04.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-05-05.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-05-06.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-05-07.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-05-09.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-05-11.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-05-19.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-05-20.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-05-22.org" "/home/alkhaldieid/Dropbox/org/roam/daily/2021-05-24.org" "/home/alkhaldieid/Dropbox/org/roam/daily/waitingNotes.org" "/home/alkhaldieid/Dropbox/org/agenda/TODOs.org" "/home/alkhaldieid/Dropbox/org/agenda/crypto.org" "/home/alkhaldieid/Dropbox/org/agenda/finance.org" "/home/alkhaldieid/Dropbox/org/agenda/investment.org" "/home/alkhaldieid/Dropbox/org/agenda/job.org" "/home/alkhaldieid/Dropbox/org/agenda/newpaperideas.org" "/home/alkhaldieid/Dropbox/org/agenda/paperTempelate.org" "/home/alkhaldieid/Dropbox/org/agenda/personal.org" "/home/alkhaldieid/Dropbox/org/agenda/proposal.org" "/home/alkhaldieid/Dropbox/org/agenda/refile.org" "/home/alkhaldieid/Dropbox/org/agenda/repos.org" "/home/alkhaldieid/Dropbox/org/agenda/research.org" "/home/alkhaldieid/Dropbox/org/agenda/salah.org" "/home/alkhaldieid/Dropbox/org/agenda/tobacco.org"))
 '(org-src-block-faces 'nil)
 '(package-selected-packages
   '(eglot elfeed yasnippet-snippets org-plus-contrib pyenv synonymous ivy org-roam color-theme-modern faff-theme modus-vivendi-theme modus-operandi-theme poet-theme tao-theme alect-themes ample-zen-theme ample-theme gruvbox-theme monokai-theme zenburn-theme moe-theme cloud-theme parchment-theme ox-reveal org-projectile evil-nerd-commenter org-roam-server company-jedi ein conda better-defaults engine-mode unicode-fonts eyebrowse org-ref helm-company org-noter magit company-quickhelp treemacs-projectile treemacs-evil treemacs helm beacon dracula-theme powerline-evil yasnippet which-key use-package try synosaurus spacemacs-theme org-roam-bibtex evil-leader evil-commentary cyberpunk-theme company-anaconda auto-complete afternoon-theme))
 '(pdf-view-midnight-colors '("#ffffff" . "#100f10"))
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#ff8059")
     (40 . "#feacd0")
     (60 . "#f78fe7")
     (80 . "#f4923b")
     (100 . "#eecc00")
     (120 . "#cfdf30")
     (140 . "#f8dec0")
     (160 . "#bfebe0")
     (180 . "#44bc44")
     (200 . "#70c900")
     (220 . "#6ae4b9")
     (240 . "#4ae8fc")
     (260 . "#00d3d0")
     (280 . "#c6eaff")
     (300 . "#2fafff")
     (320 . "#79a8ff")
     (340 . "#00bcff")
     (360 . "#b6a0ff")))
 '(vc-annotate-very-old-color nil)
 '(xterm-color-names
   ["black" "#ff8059" "#44bc44" "#eecc00" "#2fafff" "#feacd0" "#00d3d0" "gray65"])
 '(xterm-color-names-bright
   ["gray35" "#f4923b" "#70c900" "#cfdf30" "#79a8ff" "#f78fe7" "#4ae8fc" "white"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
