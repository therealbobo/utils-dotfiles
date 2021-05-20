;; -*- mode: elisp -*-

;(menu-bar-mode     -3)
(toggle-scroll-bar -1)
(tool-bar-mode     -1)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative) 


(set-frame-font "DejaVu Sans Mono-14" t nil)
;; ??
(transient-mark-mode 1)


;; basic imports
(require 'cl-lib)
(require 'package)

;; setup sources
(setq package-archives
	  '(("melpa" . "https://melpa.org/packages/")
		("org" . "http://orgmode.org/elpa/")
		("gnu" . "http://elpa.gnu.org/packages/")
))

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(package-initialize)

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
	     )

(use-package solarized-theme
  :ensure t
  :init
	(setq custom-safe-themes t)
	(setq solarized-use-variable-pitch nil
		  solarized-scale-org-headlines nil)
  (load-theme 'solarized-dark t)
  )

;; org mode config
(use-package org
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  :config
  (setq org-tags-column -70)
  (setq org-todo-keyword-faces
	'(("TODO"  . (:foreground "red" :weight bold))
	  ("NEXT"  . (:foreground "red" :weight bold))
	  ("DONE"  . (:foreground "forest green" :weight bold))
	  ("WAITING"  . (:foreground "orange" :weight bold))
	  ("CANCELLED"  . (:foreground "forest green" :weight bold))
	  ("SOMEDAY"  . (:foreground "orange" :weight bold))
	  ("OPEN"  . (:foreground "red" :weight bold))
	  ("CLOSED"  . (:foreground "forest green" :weight bold))
	  ("ONGOING"  . (:foreground "orange" :weight bold))))
  (setq org-todo-keywords
	'((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
	  (sequence "WAITING(w@/!)" "|" "CANCELLED(c!/!)")
	  (sequence "SOMEDAY(s!/!)" "|")
	  (sequence "OPEN(O!)" "|" "CLOSED(C!)")
	  (sequence "ONGOING(o)" "|")))
  (setq org-startup-with-inline-images t)
  )

(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode t)
  (vhl/define-extension 'evil 'evil-paste-after 'evil-paste-before
			'evil-paste-pop 'evil-move)
  (vhl/install-extension 'evil)
  )

(use-package auctex
  :defer t
  :ensure t
  )

(use-package magit
  :ensure t
  )

(use-package markdown-mode
  :ensure t
  )

(use-package undo-tree
  :ensure t
  )

(use-package vterm
  :ensure t
  )

(use-package yaml-mode
  :ensure t
  )

(defun edit-config ()
   "Edit your init.el on fly."
   ;; body
   (find-file "~/.config/emacs/init.el")
   (interactive)
   )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yari yaml-mode vterm volatile-highlights use-package undo-tree solarized-theme org markdown-mode magit evil auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
