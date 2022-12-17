(setq user-emacs-directory "~/.emacs.d/")				; All the packages are stored here.
(global-set-key (kbd "<escape>") 'keyboard-escape-quit) 	      	; This kill the prompt on esc key press.
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))		; This is to set the opacity of the frame.
(setq custom-file (concat user-emacs-directory "custom.el"))		; This is to keep the emacs custom settings file in a seperate file 
(load custom-file 'noerror)

(setq inhibit-startup-message t)					; This prevents the startup message.

(scroll-bar-mode -1)							; Disable visible scrollbar
(tool-bar-mode -1)          						; Disable the toolbar
(tooltip-mode -1)           						; Disable tooltips
(menu-bar-mode -1)        				    		; Disable the menu bar

(set-fringe-mode 10)         						; Give some breathing room

(add-hook 'text-mode-hook 'visual-line-mode)				; Soft Word Wrap

;; Relative Line Numbers
(setq column-number-mode t)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(set-face-attribute 'default nil :font "Cascadia Mono" :height 110)
(set-face-attribute 'font-lock-comment-face nil :font "Source Code Pro" :height 120 :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil :font "Cascadia Mono PL" :height 110 :slant 'italic)
(setq-default line-spacing 0.12)

(setq-default tab-width 4)
(setq evil-want-C-i-jump nil)
(setq-default evil-shift-width tab-width)
(setq-default indent-tabs-mode nil)

(setq auto-save-default nil)
(setq make-backup-files nil)

(setq browse-url-browser-function 'qutebrowser)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
    (package-refresh-contents))

(unless (package-installed-p 'usepackage)
  (package-install 'use-package))

(use-package evil
    :ensure t
    :init
        (setq evil-want-integration t)
        (setq evil-want-keybinding nil)
        (setq evil-split-window-below t)
        (evil-mode))
        (use-package evil-collection
    :after evil
    :ensure t
    :config
        (evil-collection-init))

(use-package org-superstar
    :ensure t
    :init
        (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
    :config
        (setq org-superstar-leading-bullet ?\s))

(use-package doom-themes
    :ensure t
    :config
        (setq doom-themes-enable-bold t
              doom-themes-enable-italics t)
        (load-theme 'doom-gruvbox t)
        (doom-themes-visual-bell-config)
        (doom-themes-org-config))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package magit
    :ensure t)

(use-package yasnippet-snippets
    :ensure t)

(use-package yasnippet
    :ensure t
    :init
        (yas-global-mode t))

(use-package company
    :ensure t
    :config
        (setq company-idle-delay 0)
        (setq company-minimum-prefix-length 3)
        (global-company-mode t))

(use-package which-key
    :ensure t
    :init
        (which-key-mode))

(use-package lsp-mode
    :init
        (setq lsp-keymap-prefix "C-c l")
    :hook (
        (python-mode . lsp)
		(c++-mode . lsp)
        (lsp-mode . lsp-enable-which-key-integration))
    :commands lsp)

(use-package lsp-ui
    :ensure t
    :hook (lsp-mode . lsp-ui-mode)
    :config
        (setq lsp-ui-sideline-enable t)
        (setq lsp-ui-sideline-show-diagnostics t))

(use-package flycheck
    :ensure t
    :defer t
    :hook (lsp-mode . flycheck-mode))

(use-package python-mode
    :ensure t
    :custom
        (python-shell-interpreter "python"))

(use-package lsp-java
    :ensure t
    :hook(
        (java-mode . lsp))
    :init
        (setq lsp-java-java-path "/home/soumava/Development/jdk-18.0.1.1/bin/java")
        (setq lsp-java-server-install-dir "/home/soumava/Development/java_lsp/jdt-language-server-1.10.0-202203040350/"))

(use-package lsp-dart
    :ensure t
    :hook (dart-mode . lsp))

(use-package lua-mode
    :ensure t
    :config
        (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode)))

(use-package ivy
:diminish
:bind (("C-s" . swiper)
    :map ivy-minibuffer-map
    ;("TAB" . ivy-alt-done)
    ("C-f" . ivy-alt-done)
    ("C-l" . ivy-alt-done)
    ("C-j" . ivy-next-line)
    ("C-k" . ivy-previous-line)
    :map ivy-switch-buffer-map
    ("C-k" . ivy-previous-line)
    ("C-l" . ivy-done)
    ("C-d" . ivy-switch-buffer-kill)
    :map ivy-reverse-i-search-map
    ("C-k" . ivy-previous-line)
    ("C-d" . ivy-reverse-i-search-kill))
:init
    (ivy-mode 1)
:config
    (setq ivy-use-virtual-buffers t)
    (setq ivy-wrap t)
    (setq ivy-count-format "(%d/%d) ")
    (setq enable-recursive-minibuffers t)

;; Use different regex strategies per completion command
    (push '(completion-at-point . ivy--regex-fuzzy) ivy-re-builders-alist) ;; This doesn't seem to work...
    (push '(swiper . ivy--regex-ignore-order) ivy-re-builders-alist)
    (push '(counsel-M-x . ivy--regex-ignore-order) ivy-re-builders-alist)

    ;; Set minibuffer height for different commands
    (setf (alist-get 'counsel-projectile-ag ivy-height-alist) 15)
    (setf (alist-get 'counsel-projectile-rg ivy-height-alist) 15)
    (setf (alist-get 'swiper ivy-height-alist) 15)
    (setf (alist-get 'counsel-switch-buffer ivy-height-alist) 7))

(use-package counsel
    :demand t
    :bind (("M-x" . counsel-M-x)
            ("C-x b" . counsel-ibuffer)
            ("C-x C-f" . counsel-find-file)
            ;; ("C-M-j" . counsel-switch-buffer)
            ("C-M-l" . counsel-imenu)
    :map minibuffer-local-map
        ("C-r" . 'counsel-minibuffer-history))
    :custom
        (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
    :config
        (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^
