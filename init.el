;; gitx
(add-to-list 'load-path "~/.emacs.d/git")
(require 'git)

;; Enable 'Backspace' key
(global-set-key "\C-h" 'backward-delete-char)
(normal-erase-is-backspace-mode t)

;; disable bell function
(setq ring-bell-function 'ignore)

;; Get rid of the tool and menu bar on top of the window
(tool-bar-mode 0)
(menu-bar-mode 0)

;; Turn on paren matching
(show-paren-mode t)
(setq show-paren-style 'mixed)

;; parens
(add-to-list 'load-path "~/.emacs.d/paredit")
(add-to-list 'load-path "~/.emacs.d/rainbow-parentheses")
(add-to-list 'load-path "~/.emacs.d/highlight-parentheses")
(require 'paredit)
(require 'rainbow-parens)
(require 'highlight-parentheses)
(setq hl-paren-colors
      '(;"#8f8f8f" ; this comes from Zenburn
                   ; and I guess I'll try to make the far-outer parens look like this
        "orange1" "yellow1" "greenyellow" "green1"
        "springgreen1" "cyan1" "slateblue1" "magenta1" "purple"))

(add-hook 'clojure-mode-hook (lambda () (highlight-parentheses-mode t)))
(add-hook 'slime-repl-mode-hook (lambda () (highlight-parentheses-mode t)))
(add-hook 'emacs-lisp-mode-hook (lambda () (highlight-parentheses-mode t)))

;; Rainbow mode
(add-to-list 'load-path "~/.emacs.d/jd-el")
(require 'rainbow-mode)

;; Auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
(ac-config-default)

;; Highlight current line
(add-to-list 'load-path "~/.emacs.d/highlight-current-line")
(require 'highlight-current-line)
(highlight-current-line-on t)
;; To customize the background color
(set-face-background 'highlight-current-line-face "#111111")

;; disable splash screen
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(normal-erase-is-backspace t))

;; current buffer name in title bar
(setq frame-title-format "%b")

;; Use "y or n" answers instead of full words "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Default tramp mode
(setq tramp-default-method "ssh"
      tramp-default-user "tashafa")
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:tashafa@%h:"))))


;; Centering code stolen from somewhere and restolen from
;; http://www.chrislott.org/geek/emacs/dotemacs.html
;; centers the screen around a line...
(global-set-key [(control l)]  'centerer)

(defun centerer ()
  "Repositions current line: once middle, twice top, thrice bottom"
  (interactive)
  (cond ((eq last-command 'centerer2)  ; 3 times pressed = bottom
         (recenter -1))
        ((eq last-command 'centerer1)  ; 2 times pressed = top
         (recenter 0)
         (setq this-command 'centerer2))
        (t                             ; 1 time pressed = middle
         (recenter)
         (setq this-command 'centerer1))))

;; Use spaces instead of tab characters for tabs
(setq-default indent-tabs-mode nil)

;;
;; Wombat theme ported from Vim
;;
(set-background-color "#1a1a1a")
(set-foreground-color "#ffffff")
(set-cursor-color "#656565")
(set-face-foreground 'font-lock-comment-face "#99968b")
(set-face-italic-p 'font-lock-comment-face t)
(set-face-foreground 'font-lock-doc-face "#99968b")
(set-face-italic-p 'font-lock-doc-face t)
(set-face-foreground 'font-lock-constant-face "#e5786d")
(set-face-foreground 'font-lock-string-face "#95e454")
(set-face-italic-p 'font-lock-string-face t)
(set-face-foreground 'font-lock-variable-name-face "#cae682")
(set-face-foreground 'font-lock-function-name-face "#cae682")
(set-face-foreground 'font-lock-type-face "#cae682")
(set-face-foreground 'font-lock-builtin-face "#8ac6f2")
(set-face-foreground 'font-lock-keyword-face "#8ac6f2")
(set-face-foreground 'font-lock-preprocessor-face "#e5786d")
(set-face-foreground 'font-lock-negation-char-face "#e7f6da")
(set-face-foreground 'link "#8ac6f2")
(set-face-bold-p 'link t)
(set-face-underline-p 'link t)
(set-face-foreground 'show-paren-match "#f6f3e8")
(set-face-background 'show-paren-match "#439dff")
(set-face-bold-p 'show-paren-match t)
(set-face-foreground 'region "#f6f3e8")
(set-face-background 'region "#444444")
(set-face-foreground 'lazy-highlight "black")
(set-face-background 'lazy-highlight "yellow")

;; auto-install.el
(add-to-list 'load-path "~/.emacs.d/auto-install")
(require 'auto-install)


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;;  Uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; ido
(require 'ido)
(ido-mode t)

;; anything.el 
(require 'anything-match-plugin)
(require 'anything-config)
(global-set-key (kbd "M-x") 'anything-M-x)
(global-set-key (kbd "M-f") 'anything)

;; Python mode
(load "~/.emacs.d/python-mode/python-mode.el")
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(add-hook 'python-mode-hook
          (lambda ()
            (set (make-variable-buffer-local 'beginning-of-defun-function)
                 'py-beginning-of-def-or-class)
            (setq outline-regexp "def\\|class ")))

;; Django html mode
(load "~/.emacs.d/django-html-mode/django-html-mode.el")
(autoload 'django-html-mode "django-html-mode")
(add-to-list 'auto-mode-alist '("\\.[sx]?html?\\'" . django-html-mode))

;; PHP mode
(add-to-list 'load-path "~/.emacs.d/php-mode")
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)

(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; Line numbering
(setq linum-format "%3d ")

;;Prefer utf-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;; Reload chrome
 (defun save-and-reload () "Save and reload browser" (interactive)
    (save-buffer)
    (shell-command "~/.emacs.d/chrome-reload"))
(define-key global-map "\C-c\C-r" 'save-and-reload)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (shadow default) :background "#2f2f2f" :foreground "#c4a000"))))
 '(mode-line ((((class color) (min-colors 88)) (:background "#2e45c5" :foreground "#00ffaa" :box (:line-width -1 :style released-button)))))
 '(mode-line-buffer-id ((t (:foreground "white" :weight bold))))
 '(mode-line-highlight ((((class color) (min-colors 88)) (:foreground "white" :box (:line-width 2 :color "grey40" :style released-button))))))