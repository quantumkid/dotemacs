;; emacs configuration file
;; Michael Murphy, 2009

;; ============================
;; User information
;; ============================

(setq user-full-name "Michael Murphy")
(setq user-mail-address "michael.murphy@uni-ulm.de")

;; ============================
;; Add the elisp path
;; ============================

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/programming/elisp/")

;; ============================
;; Load Extras
;; ============================

;; Makes buffer names unique
(load "uniquify.elc" nil t t)

;; Allows highlighting of arbitrary symbols
(load "highlight-symbol.el" nil t t)

;; Allows higlighting of whitespace
(require 'show-wspace)

;; Load ReFTeX
(autoload 'reftex-mode "reftex" "reftex major mode" t)

;; Load gnuplot
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)

;; Load Lilypond
(autoload 'LilyPond-mode "lilypond-mode")

;; Load PHP
(autoload 'php-mode "php-mode" "php major mode" t)

;; Load processing
(autoload 'processing-mode "processing-mode" "processing major mode" t)

;; Load markdown
(autoload 'markdown-mode "markdown-mode" "markdown major mode" t)

;; Load org mode
(require 'org-install)

;; Load recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; ============================
;; Set Mouse Settings
;; ============================

;; mouse button one drags the scroll bar
(global-set-key [vertical-scroll-bar down-mouse-1] 'scroll-bar-drag)

;; setup scroll mouse settings
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [s-mouse-4] 'down-one)
(global-set-key [s-mouse-5] 'up-one)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)

;; ============================
;; Set Keyboard Settings
;; ============================

(setq x-alt-keysym 'alt)
(setq x-meta-keysym 'meta)

(global-set-key [s-tab] 'next-buffer)

;; ============================
;; Language
;; ============================

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; ============================
;; Display
;; ============================

;; disable startup message
(setq inhibit-startup-message t)

;; alias y to yes and n to no
(defalias 'yes-or-no-p 'y-or-n-p)

;; set frame size
(add-to-list 'default-frame-alist '(height . 82))
(add-to-list 'default-frame-alist '(width . 82))

;; turn off cursor blinking
(setq blink-cursor-mode nil)

;; show the column number
(column-number-mode t)

;; turn off the useless toolbar and menu
(menu-bar-mode nil)
(tool-bar-mode nil)

;; truncate lines by default in all buffers
(setq default-truncate-lines t)

;; set the default fill column width
(setq default-fill-column 72)

;; put scrollbar on right
(set-scroll-bar-mode 'right)

;; ===========================
;; Global behaviour
;; ===========================

;; uniquify buffer name
(setq uniquify-buffer-name-style 'forward)

;; Pgup/dn will return exactly to the starting point.
(setq scroll-preserve-screen-position 1)

;; don't automatically add new lines when scrolling down at
;; the bottom of a buffer
(setq next-line-add-newlines nil)

;; scroll just one line when hitting the bottom of the window
(setq scroll-step 1)
(setq scroll-conservatively 1)

;; format the title-bar to always include the buffer name
(setq frame-title-format "%b")

;; resize the mini-buffer when necessary
(setq resize-minibuffer-mode t)

;; highlight during searching
(setq query-replace-highlight t)

;; highlight incremental search
(setq search-highlight t)

;; intelligent buffer switching
(setq iswitchb-mode t)

;; Set major mode to text mode by default
(setq default-major-mode 'text-mode)

;; default lpr command string
(setq lpr-switches (quote ("-P qivprinter")))

;; ============================
;; Set up auto modes
;; ============================
(setq auto-mode-alist
      (append
       '(
         ("\\.h$"             . c++-mode)
         ("\\.dps$"           . pascal-mode)
         ("\\.py$"            . python-mode)
         ("\\.Xdefaults$"     . xrdb-mode)
         ("\\.Xenvironment$"  . xrdb-mode)
         ("\\.Xresources$"    . xrdb-mode)
         ("\\.tei$"           . xml-mode)
         ("\\.php$"           . php-mode)
	 ("\\.pbs$"           . sh-mode)
	 ("\\.pov$"           . pov-mode)
	 ("\\.org$"           . org-mode)
	 ("\\.gp$"            . gnuplot-mode)
	 ("\\.ly$"            . LilyPond-mode)
	 ("\\.pde$"           . processing-mode)
	 ("\\.markdown$"      . markdown-mode)
         ) auto-mode-alist))

;; ===========================
;; Customise Modes
;; ===========================

;; text mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; f90 mode
(add-hook 'f90-mode-hook 'show-ws-highlight-trailing-whitespace)
(add-hook 'f90-mode-hook '(lambda () (highlight-phrase "!DEBUG")))
(setq f90-associate-indent 2)
(setq f90-auto-keyword-case (quote downcase-word))
(setq f90-comment-region "!!!")
(setq f90-indented-comment-re "!!?" )
(setq f90-do-indent 2)
(setq f90-if-indent 2)
(setq f90-program-indent 2)
(setq f90-type-indent 2)
(setq f90-continuation-indent 0)
(setq fortran-line-length 80)

;; org mode
(add-hook 'org-mode-hook 'auto-fill-mode)
(setq org-hide-leading-stars nil)
(setq org-time-stamp-custom-formats (quote ("(%d-%m-%y %a)" . "(%d-%m-%y %a %H:%M)")))

;; latex mode and friends
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq TeX-parse-self t)
(setq font-latex-do-multi-line nil)
(setq font-latex-fontify-script nil)
(setq font-latex-fontify-sectioning 1.0)
(setq reftex-cite-format (quote natbib))
(setq reftex-plug-into-AUCTeX t)
(add-hook 'ConTeXt-mode-hook '(lambda () (highlight-phrase "!!TODO")))
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

;; processing mode
(setq processing-location "~/programming/processing/")

;; default font
(set-frame-font "Inconsolata-12")

;; ===========================
;; Custom Functions
;; ===========================

;; activate some functions
(put 'set-goal-column 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(defvar find-file-root-prefix (if (featurep 'xemacs) "/[sudo/root@localhost]" "/sudo:root@localhost:" )
  "*The filename prefix used to open a file with `find-file-root'.")

(defvar find-file-root-history nil
  "History list for files found using `find-file-root'.")

(defvar find-file-root-hook nil
  "Normal hook for functions to run after finding a \"root\" file.")

(defun find-file-root ()
  "*Open a file as the root user.
   Prepends `find-file-root-prefix' to the selected file name so that it
   maybe accessed via the corresponding tramp method."

  (interactive)
  (require 'tramp)
  (let* ( ;; We bind the variable `file-name-history' locally so we can
   	 ;; use a separate history list for "root" files.
   	 (file-name-history find-file-root-history)
   	 (name (or buffer-file-name default-directory))
   	 (tramp (and (tramp-tramp-file-p name)
   		     (tramp-dissect-file-name name)))
   	 path dir file)

    ;; If called from a "root" file, we need to fix up the path.
    (when tramp
      (setq path (tramp-file-name-path tramp)
   	    dir (file-name-directory path)))

    (when (setq file (read-file-name "Find file (UID = 0): " dir path))
      (find-file (concat find-file-root-prefix file))
      ;; If this all succeeded save our new history list.
      (setq find-file-root-history file-name-history)
      ;; allow some user customization
      (run-hooks 'find-file-root-hook))))

;; current todo file
(setq todo-file "/home/mmurphy/documents/thesis/thesis.org")
;; add to todo list
(defun add-to-todo-list (todo-priority todo-text)
  "Adds an entry to the todo list defined in the variable 'todo-list'"
  (interactive "p\nsTODO text: ")      
  ;; add the read-in todo to the todo-file
  (let (this-buffer this-buffer-line)
    (setq this-buffer (buffer-file-name))
    (setq this-buffer-line (number-to-string (line-number-at-pos)))
    ;; add todo to the current file
    (insert (concat "[!!TODO-"
		      (format-time-string "<%Y-%m-%d-%H:%M>]")))
    (with-temp-buffer
      (insert "* TODO ")
      (if todo-priority
	  (if (< todo-priority 3)
	      (insert (elt ["[#A] " "[#B] " "[#C] "] todo-priority))))
      (insert (concat todo-text
		      (format-time-string " <%Y-%m-%d %a %H:%M>") "\n"))
      (insert "  :PROPERTIES:\n")
      (insert "  :File: " this-buffer "\n")
      (insert "  :Line: " this-buffer-line "\n")
      (insert "  :END:\n")
      (when (file-writable-p todo-file)
	(write-region (point-min)
		      (point-max)
		      todo-file t)))))

;; org capture
(setq org-default-notes-file todo-file)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "" "Tasks")
             "* TODO %? %T\n   %i\n   %a")))

(defun col-dec-to-float (color)
  "Converts decimal color in the range 0-255 to decimal."
  (let (c)
    ;; convert to number
    (setq c (string-to-number color))
    ;; divide by 255
    (setq c (/ (float c) (float 255)))
    ;; return as decimal X.XX
    (format "%.2f" c)))

(defun gimp-colors-to-context (start end)
  "Converts colors from GIMP for use in ConTeXt."
  (interactive "*r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (let (r g b)
      (while (re-search-forward "^\\([0-9]+\\)\\s-+\\([0-9]+\\)\\s-+\\([0-9]+\\)\\s-+\\([a-zA-Z ]+\\)" nil t)
	(setq r (match-string 1))
	(setq g (match-string 2))
	(setq b (match-string 3))
	(replace-match
	 (concat
	  "\\\\pgfutil@definecolor{"
	  (replace-regexp-in-string "\\s-" "-" (downcase (match-string 4)))
	  "}{rgb}{"
	  (col-dec-to-float r)
	  ","
	  (col-dec-to-float g)
	  ","
	  (col-dec-to-float b)
	  "}")
	 nil)
	)
      )
    )
  )

;; global key bindings
(global-set-key [(control x) (control r)] 'find-file-root)
(global-set-key [f5] 'revert-buffer)
(global-set-key [f9] 'org-capture)
;; (global-sey-key [f9] 'add-to-todo-list)

;; local key bindings

;; end