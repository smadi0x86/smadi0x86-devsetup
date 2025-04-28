;;; Compiled snippets and support files for `markdown-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'markdown-mode
                     '(("todo"
                        (progn
                          (if
                              (region-active-p)
                              (yas-expand-snippet "<!--TODO:-->`yas-selected-text`<!--$0-->")
                            (yas-expand-snippet "<!--TODO: $0 -->")))
                        "todo" nil nil nil "/home/smadi0x86wsl/.emacs.snippets/markdown-mode/todo" "C-x t" nil)))


;;; Do not edit! File generated at Tue Apr 29 00:44:07 2025
