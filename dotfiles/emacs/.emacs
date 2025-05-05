;; ==============================
;; Smadi0x86 Emacs Configuration
;; ==============================

;; -------------------------
;; Custom Paths and Files
;; -------------------------

(setq custom-file "~/.emacs.custom.el")      ; Store UI customizations separately
(add-to-list 'load-path "~/.emacs.local/")   ; Custom lisp module path

(load-file "~/.emacs.rc/rc.el")              ; Load core config
(load-file "~/.emacs.rc/misc-rc.el")         ; Load misc config
(load "~/.emacs.rc/autocommit-rc.el")        ; Load autocommit config

(load-file custom-file)                      ; Load theme, variables, etc.

;; -------------------------
;; Basic UI Settings
;; -------------------------

(add-to-list 'default-frame-alist '(fullscreen . fullboth)) ; Start in fullscreen
(add-to-list 'default-frame-alist `(font . "DejaVu Sans Mono-20")) ; Default font

(tool-bar-mode 0)       ; Disable toolbar
(menu-bar-mode 0)       ; Disable menubar
(scroll-bar-mode 0)     ; Disable scrollbars
(global-display-line-numbers-mode) ; Show line numbers
(cua-mode t)            ; Enable standard CUA keybindings (cut/copy/paste)
(column-number-mode 1)  ; Show column number
(show-paren-mode 1)     ; Highlight matching parentheses

;; Zoom with Ctrl + = / -
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Fullscreen toggle
(global-set-key (kbd "C-`") 'toggle-frame-fullscreen)

;; -------------------------
;; Magit (Git Interface)
;; -------------------------

(rc/require 'cl-lib)    ; Required for magit on Windows
(rc/require 'magit)

(setq magit-auto-revert-mode nil) ; Disable magit's auto revert

(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

;; -------------------------
;; Theme
;; -------------------------

(rc/require-theme 'gruber-darker)

;; -------------------------
;; Command Execution (M-x)
;; -------------------------

(rc/require 'smex)                         ; Better M-x interface
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; -------------------------
;; Ido (Better File/Buffer Switching)
;; -------------------------

(ido-mode 1)
(ido-everywhere 1)

;; -------------------------
;; Dired (File Manager)
;; -------------------------

(require 'dired-x)

(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$")) ; Hide dotfiles
(setq-default dired-dwim-target t)         ; Smart target for copy/move
(setq dired-listing-switches "-alh")       ; Human-readable listing
(setq dired-mouse-drag-files t)            ; Allow drag-and-drop

;; -------------------------
;; YASnippet (Snippets)
;; -------------------------

(rc/require 'yasnippet)
(require 'yasnippet)

(setq yas/triggers-in-field nil)
(setq yas-snippet-dirs '("~/.emacs.snippets/"))

(yas-global-mode 1)

;; -------------------------
;; Move Text (Up/Down)
;; -------------------------

(rc/require 'move-text)

(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;; -------------------------
;; TRAMP (Remote Editing)
;; -------------------------

(setq tramp-auto-save-directory "/tmp") ; Avoid autosave issues with TRAMP

;; -------------------------
;; Modes and Language Support
;; -------------------------

(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(require 'fasm-mode)
(add-to-list 'auto-mode-alist '("\\.asm\\'" . fasm-mode))

;; Require common programming modes
(rc/require
 'yaml-mode
 'cmake-mode
 'rust-mode
 'csharp-mode
 'nim-mode
 'markdown-mode
 'dockerfile-mode
 'toml-mode
 'nginx-mode
 'go-mode
 'php-mode
 'typescript-mode
 )


;; Add a new error pattern for "file(line,col) Warning:" format
(add-to-list 'compilation-error-regexp-alist
             '("\\([a-zA-Z0-9\\.]+\\)(\\([0-9]+\\)\\(,\\([0-9]+\\)\\)?) \\(Warning:\\)?"
               1 2 (4) (5)))

;; =========================
;; End of Config
;; =========================
