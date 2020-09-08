;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     nginx
     php
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (shell :variables shell-default-shell 'eshell)
     csv
     (org :variables
          org-enable-org-journal-support t)
     markdown
     yaml
     javascript
     html
     (ruby :variables
           ruby-enable-enh-ruby-mode t
           ruby-test-runner 'rspec)
     gtags
     better-defaults
     emacs-lisp
     git
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control

     ;;; comany-mode off because too slow
     ; (auto-completion :disabled-for scss)
     (auto-completion :variables
                      spacemacs-default-company-backends '(company-files company-capf company-dabbrev company-robe))

     auto-completion

     ruby-on-rails
     react
     helm
     vue
     neotree
     tern
     typescript
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
     sequential-command
     visual-regexp
     visual-regexp-steroids
     eshell-z
     editorconfig
     prettier-js
     org2blog
     org-gcal
     ;org-fancy-priorities
     exec-path-from-shell
     po-mode
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    php-extras
                                    org-download
   )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Ricty Diminished"
                               :size 14
                               :weight light
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   dotspacemacs-mode-line-theme 'vanilla
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (require 'org-tempo)

  ;; 手動で加えるマクロ置き場
  (add-to-list 'load-path (expand-file-name "~/.spacemacs.d/lisp"))

  ;; mac-auto-ascii-mode
  (mac-auto-ascii-mode 1)

  ;; Native Eshell
  (defun eshell-new()
    "Open a new instance of eshell."
    (interactive)
    (eshell 'N))

  (defun make-eshell (name)
    "Create a shell buffer named NAME."
    (interactive "sName: ")
    (setq name (concat "$" name))
    (eshell 'N)
    (rename-buffer name))

  ;; 行番号
  ;;(global-nlinum-mode)
  ;(setq linum-format "%d ")
  ;(global-display-line-numbers-mode)

  ;; save sessions
  ;(desktop-save-mode 1)

  ;; sequential-command.el ctr-a a
  (require 'sequential-command-config)
  (sequential-command-setup-keys)

  ;; no encoding
  (defun enh-ruby-add-encoding-comment-on-save () nil)
  (defun remove-enh-magic-comment ()
    (remove-hook 'before-save-hook 'enh-ruby-mode-set-encoding t))
  (add-hook 'enh-ruby-mode-hook 'remove-enh-magic-comment)

  ;; rails
  (setq projectile-rails-vanilla-command "docker-compose run web bin/rails")

  ;;; jsx
  ;(add-to-list 'auto-mode-alist '("\\.jsx$" . js-jsx-mode))

  ;;; js-mode
  ;(setq js-indent-level 2)

  ;;; windmove
  (windmove-default-keybindings 'super)
  (setq windmove-wrap-around t)
  ; バッファ移動
  (global-set-key (kbd "C-c h") 'windmove-left)
  (global-set-key (kbd "C-c l") 'windmove-right)
  (global-set-key (kbd "C-c j") 'windmove-up)
  (global-set-key (kbd "C-c k") 'windmove-down)

  ;;; wgrep
  ; eでwgrepモードにする
  (setf wgrep-enable-key "e")
  ; wgrep終了時にバッファを保存
  (setq wgrep-auto-save-buffer t)
  ; read-only bufferにも変更を適用する
  (setq wgrep-change-readonly-file t)

  ;;; org-mode
  ;; 拡張子がorgのファイルを開いた時，自動的にorg-modeにする
  ;(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

  ;;; company-mode
  ; 全バッファで有効にする
  (global-company-mode)
  ;(require 'company)
  ;(add-to-list 'company-backends '(company-capf company-dabbrev))
  ; デフォルトは0.5
  ;(setq company-idle-delay 0)
  ; デフォルトは4
  ;(setq company-minimum-prefix-length 2)
  ; 候補の一番下でさらに下に行こうとすると一番上に戻る
  ;(setq company-selection-wrap-around t)
  ; binding.pry

  ;;; scss-mode
  (require 'scss-mode)
  (add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
  ;; インデント幅を2にする
  ;; コンパイルは compass watchで行うので自動コンパイルをオフ
  (defun scss-custom ()
    "scss-mode-hook"
    (and
     (set (make-local-variable 'css-indent-offset) 2)
     (set (make-local-variable 'scss-compile-at-save) nil)
     )
    )
  (add-hook 'scss-mode-hook
            '(lambda() (scss-custom)))

  ;;; rspec-mode
  ; zsh
  (defadvice rspec-compile (around rspec-compile-around)
    "Use BASH shell for running the specs because of ZSH issues."
    (let ((shell-file-name "/bin/bash"))
      ad-do-it))

  (ad-activate 'rspec-compile)

  ;;; web-mode
  ;(defun my-web-mode-hook ()
  ;  "Hooks for Web mode."
  ;  (setq web-mode-markup-indent-offset 2)
  ;  )
  ;(add-hook 'web-mode-hook  'my-web-mode-hook)

  ;; helm-ag
  (global-set-key (kbd "C-c s") 'helm-do-ag)
  (global-set-key (kbd "C-c b") 'backward-kill-sexp) ;推奨

  ;; query-replace-regexp
  (global-set-key (kbd "C-c q") 'query-replace-regexp)

  ;; rjsx-mode
  ;(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
  ;(setq js-switch-indent-offset 2)

  ;; helm-gtag
  ;(add-hook 'helm-gtags-mode-hook
  ;          '(lambda ()
               ;; ;;入力されたタグの定義元へジャンプ
               ;; (local-set-key (kbd "M-t") 'helm-gtags-find-tag)

               ;; ;;入力タグを参照する場所へジャンプ
               ;; (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)

               ;; ;;入力したシンボルを参照する場所へジャンプ
               ;; (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)

               ;; ;;タグ一覧からタグを選択し, その定義元にジャンプする
               ;; (local-set-key (kbd "M-l") 'helm-gtags-select)

               ;; ;;ジャンプ前の場所に戻る
               ;; (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))

  ;(add-hook 'rjsx-mode-hook 'helm-gtags-mode)

  ;;; visual-regex
  (define-key global-map (kbd "C-c v r") 'vr/replace)
  (define-key global-map (kbd "C-c v q") 'vr/query-replace)

  ;;; eshell heml
  (add-hook 'eshell-mode-hook
            (lambda ()
              (eshell-cmpl-initialize)
              (define-key eshell-mode-map [remap eshell-pcomplete] 'helm-esh-pcomplete)
              (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)))

  ;; 初期Frameサイズを指定
  (setq inhibit-startup-screen t)
  (setq initial-frame-alist
        '((top . 0) (left . 0) (width . 210) (height . 100))
        )

  ;; ウィンドウを半透明にする
  (if window-system
      (progn
        (set-frame-parameter nil 'alpha 95)
        )
    )

  ; rspec
  (add-hook 'after-init-hook 'inf-ruby-switch-setup)

  ;;; org-mode
  ;;; Org-captureの設定
  ; Org-captureのテンプレート（メニュー）の設定
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/Dropbox/Org/agenda/inbox.org" "Todos")
           "* %?\nEntered on %U\n %i\n %a" :prepend t)
          ("n" "Note" entry (file+headline "~/Dropbox/Org/note/index.org" "Notes")
           "* %?\nEntered on %U\n %i\n %a" :prepend t)))

  ;;; https://www.reddit.com/r/emacs/comments/749t8a/keep_a_blank_line_after_a_code_block_in_orgmode/
  ;(setq org-blank-before-new-entry '((heading . t) (plain-list-item . nil)))
  (setq org-image-actual-width nil)

  ;;; org2blog
  (setq org2blog/wp-blog-alist
        '(("startuphacker.jp"
           :url "https://startuphacker.jp/wp/xmlrpc.php"
           :username "taka"
           :password "UATjymVMdgoUGeYJm9WUvEXCMR8LKTfteegFNpZZmNqCMunwuygLNcrAdteEWMdh"
           :default-title "Hello World"
           :default-categories ("Wordpress")
           :tags-as-categories nil)))
  (setq org2blog/wp-use-sourcecode-shortcode t)

  ;; (require 'auth-source)
  ;; (let* ((credentials (auth-source-user-and-password "startuphacker.jp"))
  ;;        (username (nth 0 credentials))
  ;;        (password (nth 1 credentials))
  ;;        (config `("startuphacker.jp"
  ;;                  :url "https://startuphacker.jp/xmlrpc.php"
  ;;                  :username ,username
  ;;                  :password ,password)))
  ;;   (setq org2blog/wp-blog-alist config))

  ;; Keybonds
  (global-set-key [(hyper a)] 'mark-whole-buffer)
  (global-set-key [(hyper v)] 'yank)
  (global-set-key [(hyper c)] 'kill-ring-save)
  (global-set-key [(hyper s)] 'save-buffer)
  (global-set-key [(hyper l)] 'goto-line)
  (global-set-key [(hyper w)]
                  (lambda () (interactive) (delete-window)))
  (global-set-key [(hyper z)] 'undo)

  ;; mac switch meta key
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'hyper)

  ;; line
  ;(setq line-spacing 0.2)

  ;; org-gcal
  (setq org-gcal-client-id "271695811110-pjtd5483p2ibsr79k0m7679084qur3dd.apps.googleusercontent.com"
        org-gcal-client-secret "Sx9DIULyvanWdWvai8MQTQmv"
        ;; ID が sample@foo.google.com のカレンダーと ~/calendar.org を同期
        org-gcal-file-alist '(("mizutani.to_89sjf893tn5pspj7vn55hicbu0@group.calendar.google.com" . "~/Dropbox/Org/agenda/todo.org")))
  ;; token の保存場所を変更
  (setq org-gcal-dir "~/.org-gcal")

  ;; org-journal
  (setq org-journal-file-format "%Y/%m/%d.org")
  (setq org-journal-dir "~/Dropbox/Org/journal")
  (setq org-journal-date-prefix "#+STARTUP: showall\n#+TITLE: ")
  (setq org-journal-date-format "%Y/%m/%d\n* Timeline")
  (setq org-journal-time-format "%R\n")

  ;; アジェンダ表示の対象ファイル
  (setq org-agenda-files '(
                           "~/Dropbox/Org/agenda/inbox.org"
                           "~/Dropbox/Org/agenda/todo.org"))

  ;;; org-mode
  ; priority
  (setq org-highest-priority ?A)
  (setq org-lowest-priority ?H)
  (setq org-default-priority ?H)
  (setq org-agenda-fontify-priorities 'nil)

  ;; org-fancy-priorities
  ;(use-package org-fancy-priorities
  ;  :ensure t
  ;  :hook
  ;  (org-mode . org-fancy-priorities-mode)
  ;  :config
  ;  (setq org-fancy-priorities-list '((?A . "⚠︎")
  ;                                    (?B . "①")
  ;                                    (?C . "②")
  ;                                    (?D . "③")
  ;                                    (?E . "④")
  ;                                    (?F . "⑤")
  ;                                    (?G . "⑥")
  ;                                    (?H . "➡"))))

  ;;; PATHを引き継ぐ
  (exec-path-from-shell-initialize)

  ;; term-mode
  (add-hook 'term-mode-hook '(lambda ()
                               (define-key term-raw-map "\C-r" 'term-send-raw)
                               (define-key term-raw-map "\C-p" 'term-send-raw)
                               (define-key term-raw-map "\C-n" 'term-send-raw)))

  ;; docker-robe
  ;(require 'docker-robe)
  ;(docker-robe:activate)

  ; server start for emacs-client
  (require 'server)
  (unless (server-running-p)
    (server-start))
  ;;; multi-term buffer name
  (defadvice term-send-raw (around rename-term-name activate)
    (progn
      (rename-buffer
       (concat (shell-command-to-string "pwd | xargs basename |  tr -d '\n'")
               " - terminal "
               (format-time-string "[%M:%S]")))
      ad-do-it))

  ;;; react layer
  (setq js2-strict-missing-semi-warning nil)
  (setq-default
   ;; js2-mode
   js2-basic-offset 2
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)
  (with-eval-after-load 'web-mode
    (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(desktop-save-mode nil)
 '(js-indent-level 2)
 '(markdown-fontify-code-blocks-natively t)
 '(package-selected-packages
   (quote
    (org-fancy-priorities org-journal org-gcal request-deferred deferred nginx-mode org2blog metaweblog xml-rpc lv prettier-js parent-mode flx iedit anzu goto-chg bind-map bind-key popup pkg-info epl org-mime editorconfig php-auto-yasnippets drupal-mode phpunit phpcbf php-extras php-mode xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help enh-ruby-mode vue-mode edit-indirect ssass-mode vue-html-mode visual-regexp-steroids visual-regexp nlinum-relative helm-themes helm-swoop helm-projectile helm-mode-manager helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet ace-jump-helm-line powerline helm helm-core diminish packed counsel swiper ivy highlight smartparens evil undo-tree avy async hydra projectile f dash s unfill org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download mwim htmlize gnuplot ggtags projectile-rails inflections feature-mode fuzzy company-web web-completion-data company-tern dash-functional tern company-statistics auto-yasnippet ac-ispell auto-complete helm-gtags rjsx-mode ac-dabbrev helm-ag csv-mode ac-inf-ruby company ox-gfm mmm-mode markdown-toc markdown-mode gh-md yaml-mode web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc coffee-mode smeargle orgit magit-gitflow gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor nlinum sequential-command web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode haml-mode emmet-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby ws-butler winum which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline smex restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-make google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word counsel-projectile column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link)))
 '(safe-local-variable-values
   (quote
    ((rspec-docker-container . "web")
     (rspec-docker-cwd . "/eyan/")
     (rspec-use-docker-when-possible t))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "MeiryoKe_Console" :foundry "nil" :slant normal :weight normal :height 120 :width normal))))
 '(markdown-code-face ((t (:background "#303236"))))
 '(org-agenda-date-today ((t (:inherit bold :foreground "#4f97d7" :weight bold :height 1.1))))
 '(org-agenda-done ((t (:foreground "#86dc2f" :height 1.0))))
 '(org-document-title ((t (:inherit bold :foreground "#bc6ec5" :underline t :height 1))))
 '(org-level-1 ((t (:foreground "#4f97d7" :height 1.0))))
 '(org-level-2 ((t (:inherit bold :foreground "#2d9574" :height 1))))
 '(org-level-3 ((t (:foreground "#67b11d" :weight normal :height 1))))
 '(org-scheduled-today ((t (:foreground "#bc6ec5" :height 1.0)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(desktop-save-mode nil)
 '(js-indent-level 2)
 '(markdown-fontify-code-blocks-natively t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-columns-default-format "%25ITEM %TODO %3PRIORITY %TAGS")
 '(package-selected-packages
   (quote
    (po-mode org-fancy-priorities org-journal org-gcal request-deferred deferred nginx-mode org2blog metaweblog xml-rpc lv prettier-js parent-mode flx iedit anzu goto-chg bind-map bind-key popup pkg-info epl org-mime editorconfig php-auto-yasnippets drupal-mode phpunit phpcbf php-extras php-mode xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help enh-ruby-mode vue-mode edit-indirect ssass-mode vue-html-mode visual-regexp-steroids visual-regexp nlinum-relative helm-themes helm-swoop helm-projectile helm-mode-manager helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet ace-jump-helm-line powerline helm helm-core diminish packed counsel swiper ivy highlight smartparens evil undo-tree avy async hydra projectile f dash s unfill org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download mwim htmlize gnuplot ggtags projectile-rails inflections feature-mode fuzzy company-web web-completion-data company-tern dash-functional tern company-statistics auto-yasnippet ac-ispell auto-complete helm-gtags rjsx-mode ac-dabbrev helm-ag csv-mode ac-inf-ruby company ox-gfm mmm-mode markdown-toc markdown-mode gh-md yaml-mode web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc coffee-mode smeargle orgit magit-gitflow gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor nlinum sequential-command web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode haml-mode emmet-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby ws-butler winum which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline smex restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-make google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word counsel-projectile column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link)))
 '(safe-local-variable-values
   (quote
    ((rspec-docker-container . "web")
     (rspec-docker-cwd . "/eyan/")
     (rspec-use-docker-when-possible t))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "MeiryoKe_Console" :foundry "nil" :slant normal :weight normal :height 120 :width normal))))
 '(markdown-code-face ((t (:background "#303236"))))
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight normal))))
 '(markdown-header-face-1 ((t (:inherit bold :foreground "#4f97d7" :height 1.0))))
 '(markdown-header-face-2 ((t (:inherit bold :foreground "#2d9574" :height 1.0))))
 '(org-agenda-date-today ((t (:inherit bold :foreground "#4f97d7" :weight bold :height 1.1))))
 '(org-agenda-done ((t (:foreground "#86dc2f" :height 1.0))))
 '(org-document-title ((t (:inherit bold :foreground "#bc6ec5" :underline t :height 1.0))))
 '(org-level-1 ((t (:foreground "#4f97d7" :height 1.0))))
 '(org-level-2 ((t (:inherit bold :foreground "#2d9574" :weight bold :height 1.0))))
 '(org-level-3 ((t (:foreground "#67b11d" :weight normal :height 1.0))))
 '(org-scheduled-today ((t (:foreground "#bc6ec5" :height 1.0)))))
)
