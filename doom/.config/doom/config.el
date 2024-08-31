;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Hirotaka Mizutani"
      user-mail-address "hirotaka@mizutani.to")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
;; Moralerspace Argon NF
(setq doom-font (font-spec :family "Moralerspace Argon NF" :size 13 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "Moralerspace Argon NF" :size 13)
      doom-symbol-font (font-spec :family "Moralerspace Argon NF" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-yokohama-night
      ;; doom-yokohama-night-brighter-comments  t
      ;; doom-yokohama-night-brighter-modeline t
      )
(set-frame-parameter nil 'alpha-background 70)
(add-to-list 'default-frame-alist '(alpha-background . 70))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Workspaces/github.com/hirotaka/org/")

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

;; Serve mode
;; (server-mode +1)

;; transparency
                                        ; (set-frame-parameter (selected-frame) 'alpha '(75 . 50))
                                        ; (add-to-list 'default-frame-alist '(alpha . (75 . 50)))
;; (set-frame-parameter nil 'alpha-background 100)
;; (add-to-list 'default-frame-alist '(alpha-background . 100))
;; (defun kb/toggle-window-transparency ()
;;   "Toggle transparency."
;;   (interactive)
;;   (let ((alpha-transparency 75))
;;     (pcase (frame-parameter nil 'alpha-background)
;;       (alpha-transparency (set-frame-parameter nil 'alpha-background 100))
;;       (t (set-frame-parameter nil 'alpha-background alpha-transparency)))))
                                        ; (defun set-transparency ()
                                        ;   (interactive)
                                        ;  (set-face-background 'default "unspecified-bg" (selected-frame))
                                        ;  (set-face-background 'line-number "unspecified-bg" (selected-frame)))
                                        ;
                                        ;

;; disable quit confirmation
(setq confirm-kill-emacs nil)

;; Mouse scroll
(map! [mouse-4] #'scroll-down-line
      [mouse-5] #'scroll-up-line)

;; org-clock
(after! org-clock
  ;; with 0:00 duration
  (setq org-clock-out-remove-zero-time-clocks nil))

;; org
(after! org
  (setq org-agenda-files(list "~/Workspaces/github.com/hirotaka/org/roam/agenda/todo.org"))

  ;; Week view start from monday
  (setq org-agenda-start-on-weekday 1)
  (setq org-agenda-span 'week)
  (setq org-agenda-start-day "-1d")

  ;; org clock 1d -> 24h
  (setq org-duration-format 'h:mm)

  ;; org indent mode
  ;; (setq org-adapt-indentation t)

  ;; 日付表示を英語表示にするように（org-agendaでの日付表示）
  (setq system-time-locale "C")

  ;; org-journal
  (setq org-journal-file-format "%Y/%m/%d.org")
  (setq org-journal-dir "~/Workspaces/github.com/hirotaka/org/roam/journal")
  (setq org-journal-date-prefix "#+STARTUP: showall\n#+TITLE: ")
  (setq org-journal-date-format "%Y/%m/%d\n* Timeline")
  (setq org-journal-time-format "%R\n")

  ;; org-todo
  ;; (setq org-todo-repeat-to-state t)
  ;; (setq org-clock-in-switch-to-state "DONE")
  ;; (setq org-log-into-drawer "LOGBOOK")

  ;; org-agenda
  (setq calendar-week-start-day 1)
  (setq org-agenda-skip-scheduled-if-done t)
  (setq org-agenda-time-grid
        (quote
         ((weekly today)
          (459 659 0859 1059 1259 1459 1659 1859 2059 2259)
          "......" "----------------")))
  (setq org-agenda-prefix-format
        '((agenda  . " %i %-12:c%?-12t%-6e% s")
          (timeline  . "  % s")
          (todo  . " %i %-30:c")
          (tags  . " %i %-12:c")
          (search . " %i %-12:c")))
  (map! :map org-agenda-mode-map
        :localleader
        :n "l" #'org-agenda-log-mode))


;; org-roam-caputure
;; https://www.takeokunn.org/posts/permanent/20231219122351-how_to_manage_blog_by_org_roam/
;;
;; (autoload-if-found '(org-roam-capture) "org-roam-capture" nil t)
;; (global-set-key (kbd "C-c n c") #'org-roam-capture)
(with-eval-after-load 'org-roam-capture
  (setq org-roam-capture-templates '(("f" "Fleeting(一時メモ)" plain "%?"
                                      :target (file+head "fleeting/%<%Y%m%d%H%M%S>-${slug}.org" "#+TITLE: ${title}\n")
                                      :unnarrowed t)
                                     ("l" "Literature(文献)" plain "%?"
                                      :target (file+head "literature/%<%Y%m%d%H%M%S>-${slug}.org" "#+TITLE: ${title}\n")
                                      :unnarrowed t)
                                     ("p" "Permanent(記事)" plain "%?"
                                      :target (file+head "permanent/%<%Y%m%d%H%M%S>-${slug}.org" "#+TITLE: ${title}\n")
                                      :unnarrowed t)
                                     ("j" "Journal(振り返り)" plain "%?"
                                      :target (file+head "journal/%<%Y>/%<%m>/%<%d>.org" "#+STARTUP: showall\n#+TITLE: %<%Y/%m/%d>\n")
                                      :unnarrowed t))))

;;; alfred
;; (defun make-orgroamcapture-frame ()
;;   "Create a new frame and run org-roam-capture."
;;   (interactive)

;;   (make-frame '((name . "remember") (width . 160) (height . 32)
;;                 (top . 400) (left . 300)
;;                 ))
;;   (select-frame-by-name "remember")
;;   (org-roam-capture))

;;; forge
(setq auth-sources '("~/.authinfo"))

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))

;; lsp-tailwindcss
(use-package! lsp-tailwindcss)

;; image paste
(with-eval-after-load "org"
  (defun org-insert-clipboard-image ()
    "Generate png file from a clipboard image and insert a link to current buffer."
    (interactive)
    (let* ((filename
            (concat (file-name-nondirectory (buffer-file-name))
                    "_image/"
                    (format-time-string "%Y%m%d_%H%M%S")
                    ".png")))
      (unless (file-exists-p (file-name-directory filename))
        (make-directory (file-name-directory filename)))
      (shell-command (concat "pngpaste " filename))
      (if (file-exists-p filename)
          (insert (concat "[[file:" filename "]]")))
      (org-display-inline-images)))

  (global-set-key (kbd "C-M-y") 'org-insert-clipboard-image))

;; https://emacs.stackexchange.com/a/38367
(after! org
  (defun mw-org-log-delete ()
    "Delete logbook drawer of subtree."
    (interactive)
    (save-excursion
      (goto-char (org-log-beginning))
      (when (save-excursion
              (save-match-data
                (beginning-of-line 0)
                (search-forward-regexp org-drawer-regexp)
                (goto-char (match-beginning 1))
                (looking-at "LOGBOOK")))
        (org-mark-element)
        (delete-region (region-beginning) (region-end))
        (org-remove-empty-drawer-at (point))))))

;; https://discourse.doomemacs.org/t/how-to-have-tool-bar-mode-0-apply-at-startup-to-avoid-large-title-bar-on-macos-sonoma-when-using-railwaycat-homebrew-emacsmacport/4222/4
(add-hook 'doom-after-init-hook (lambda () (tool-bar-mode 1) (tool-bar-mode 0)))
