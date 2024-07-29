;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


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
(setq doom-font (font-spec :family "MonaspiceAr Nerd Font" :size 20 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "MonaspiceAr Nerd Font" :size 21))

;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

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

(defcustom catppuccin-mocha-colors '((rosewater . "#f5e0dc")
                                     (flamingo  . "#f2cdcd")
                                     (pink      . "#f5c2e7")
                                     (mauve     . "#cba6f7")
                                     (red       . "#f38ba8")
                                     (maroon    . "#eba0ac")
                                     (peach     . "#fab387")
                                     (yellow    . "#f9e2af")
                                     (green     . "#a6e3a1")
                                     (teal      . "#94e2d5")
                                     (sky       . "#89dceb")
                                     (sapphire  . "#74c7ec")
                                     (blue      . "#89b4fa")
                                     (lavender  . "#b4befe")
                                     (text      . "#cdd6f4")
                                     (subtext1  . "#bac2de")
                                     (subtext0  . "#a6adc8")
                                     (overlay2  . "#9399b2")
                                     (overlay1  . "#7f849c")
                                     (overlay0  . "#6c7086")
                                     (surface2  . "#585b70")
                                     (surface1  . "#45475a")
                                     (surface0  . "#313244")
                                     (base      . "#000000")
                                     (mantle    . "#000000")
                                     (crust     . "#000000"))
  "Colors used for catppuccin-mocha."
  :tag "Mocha Colors"
  :options '(rosewater flamingo pink mauve red maroon peach yellow green teal sky sapphire blue lavender text subtext1 subtext0 overlay2 overlay1 overlay0 surface2 surface1 surface0 base mantle crust)
  :type '(alist :key-type symbol :value-type string)
  :group 'catppuccin)

(setq confirm-kill-emacs nil)
(setq doom-theme 'catppuccin)
(require 'ox-beamer)
(defun eshell-toggle-bottom ()
  (interactive)
  (let* ((eshell-buffer-name "*eshell-bottom*")
         (eshell-window (get-buffer-window eshell-buffer-name)))
    (if eshell-window
        (delete-window eshell-window)
      (select-window (split-window-vertically (- (window-height) 10)))
      (eshell))))

(map! :leader
      :desc "Kill compilation"
      "c k" #'kill-compilation)

(map! :leader
      :desc "Toggle modeline"
      "m l" #'hide-mode-line-mode)


(map! :leader
      (:prefix ("o" . "open")
       :desc "Toggle bottom eshell" "e" #'eshell-toggle-bottom))
