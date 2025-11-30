;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
;; #############################################################################################################
;; Got this block from Distrotube
;; (custom-set-faces
;; '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "variable-pitch"))))
;; '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.6))))
;; '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.5))))
;; '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.4))))
;; '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.3))))
;; '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.2))))
;; '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.1)))))
;; #############################################################################################################

;; (custom-theme-set-faces!
;; 'doom-gruvbox
;; '(org-level-8 :inherit outline-3 :height 1.0)
;; '(org-level-7 :inherit outline-3 :height 1.0)
;; '(org-level-6 :inherit outline-3 :height 1.1)
;; '(org-level-5 :inherit outline-3 :height 1.1)
;; '(org-level-4 :inherit outline-4 :height 1.2)
;; '(org-level-3 :inherit outline-3 :height 1.2)
;; '(org-level-2 :inherit outline-2 :height 1.3)
;; '(org-level-1 :inherit outline-1 :height 1.4)
;; '(org-document-title  :height 1.8 :bold t :underline nil))

;; Got this from Gemini ######################################################################################
;; (custom-set-faces!
;;   `(org-level-1 :foreground ,(doom-color 'magenta))
;;   `(org-level-2 :foreground ,(doom-color 'dark-blue))
;;   `(org-level-3 :foreground ,(doom-color 'green))
;;   `(org-level-4 :foreground ,(doom-color 'orange))
;;   `(org-level-5 :foreground ,(doom-color 'blue))
;;   `(org-level-6 :foreground ,(doom-color 'purple))
;;   `(org-level-7 :foreground ,(doom-color 'teal))
;;   `(org-level-8 :foreground ,(doom-color 'fg)))

(defun my-setup-org-faces ()
  "Apply colors and font sizes to Org headings."
  (interactive)
  (require 'org-faces) ;; <--- ADD THIS LINE to fix the "Invalid face" error
  
  ;; Level 1: Red, huge (1.4)
  (set-face-attribute 'org-level-1 nil
                      :foreground (doom-color 'magenta)
                      :height 1.4
                      :weight 'bold)

  ;; Level 2: Orange, large (1.3)
  (set-face-attribute 'org-level-2 nil
                      :foreground (doom-color 'dark-blue)
                      :height 1.3
                      :weight 'bold)

  ;; Level 3: Yellow, medium (1.2)
  (set-face-attribute 'org-level-3 nil
                      :foreground (doom-color 'green)
                      :height 1.2
                      :weight 'bold)

  ;; Level 4: Green, medium (1.2)
  (set-face-attribute 'org-level-4 nil
                      :foreground (doom-color 'orange)
                      :height 1.2
                      :weight 'bold)

  ;; Level 5: Blue, small-medium (1.1)
  (set-face-attribute 'org-level-5 nil
                      :foreground (doom-color 'blue)
                      :height 1.1
                      :weight 'bold)

  ;; Level 6: Purple, small-medium (1.1)
  (set-face-attribute 'org-level-6 nil
                      :foreground (doom-color 'purple)
                      :height 1.1
                      :weight 'bold)

  ;; Level 7: Teal, normal size (1.0)
  (set-face-attribute 'org-level-7 nil
                      :foreground (doom-color 'teal)
                      :height 1.0
                      :weight 'bold)

  ;; Level 8: Foreground color, normal size (1.0)
  (set-face-attribute 'org-level-8 nil
                      :foreground (doom-color 'fg)
                      :height 1.0
                      :weight 'bold)

  ;; Document Title: Huge, no underline
  (set-face-attribute 'org-document-title nil
                      :foreground (doom-color 'fg)
                      :height 1.8
                      :weight 'bold
                      :underline nil))

;; Keep these hooks as they were
(after! org
  (my-setup-org-faces))

(add-hook 'doom-load-theme-hook #'my-setup-org-faces)

;; Apply these settings after Org loads
(after! org
  (my-setup-org-faces))

;; Re-apply if you switch themes (so colors update correctly)
(add-hook 'doom-load-theme-hook #'my-setup-org-faces)

;; Hide the leading asterisks (e.g., "** Heading" becomes "   Heading")
(setq org-hide-leading-stars t)

(after! org-superstar
  (setq org-superstar-headline-bullets-list '("◉" "○" "✸" "✿" "✤" "✜" "◆" "▶")
        ;; Optional: Stop cycling bullets after a certain level
        org-superstar-cycle-headline-bullets nil))
;; ###########################################################################################################
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 16 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
