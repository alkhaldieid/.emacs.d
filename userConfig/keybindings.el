;; set the leader key
(evil-leader/set-leader "<SPC>") 
;; use (evil-leader/set-key to bind keys in the leader map

(evil-leader/set-key
 "f" 'find-file
 "d"'(lambda() (interactive) (find-file "~/doing/second")) 
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
 "ss" 'synonyms
 )
