;; user-name + email
(setq user-full-name "sylvester"
      user-mail-address "mhxxx2005@gmail.com")

(setq doom-font (font-spec :family "Inconsolata" :size 18))
(setq doom-symbol-font (font-spec :family "Inconsolata Nerd Font Propo"))
(setq doom-emoji-font (font-spec :family "Inconsolata Nerd Font Propo"))

(setq doom-theme 'doom-gruvbox)
(setq custom-safe-themes t)

(setq doom-modeline-height 30)

;; Set icons
(after! nerd-icons
  (setq doom-modeline-major-mode-icon t))

(map! :leader
      :prefix ("t")
      :desc "Toggle Modeline" "M" #'hide-mode-line-mode)

(setq display-line-numbers-type 'relative)
;;
;;(defun config/line-number-setup ()
;;  (setq display-line-numbers-type t)
;;  (display-line-numbers-mode))

(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook
                typst-ts-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;;(add-hook 'prog-mode-hook #'config/line-number-setup)

;; Disable the highlight for current line
(add-hook 'text-mode-hook (lambda () (hl-line-mode -1)))

(use-package! rainbow-delimiters
  :hook (prog-mode-hook . rainbow-delimiters-mode))
(show-paren-mode t)

(use-package! focus
  :config
  (map! :leader
        :prefix ("t")
        :desc "Toggle Dim" "D" #'focus-mode))

(add-hook 'term-mode-hook 'evil-emacs-state)

;; set the default dir for org files
(setq org-directory "~/Documents/org/")
(setq org-attach-dir "~/Documents/org/.attach")
(setq org-attach-id-dir "~/Documents/org/.attach")
(setq org-id-locations-file "~/Documents/org/.orgids")
(setq org-archive-location "~/Documents/org/archive/%s_archive::") ;; org archive dir

;; Make the content unfolded when open the file
(setq org-startup-folded 'content)

(custom-set-faces!
  `(outline-1 :height 1.3 :foreground ,(nth 1 (nth 14 doom-themes--colors)))
  `(outline-2 :height 1.25 :foreground ,(nth 1 (nth 15 doom-themes--colors)))
  `(outline-3 :height 1.2 :foreground ,(nth 1 (nth 19 doom-themes--colors)))
  `(outline-4 :height 1.1 :foreground ,(nth 1 (nth 23 doom-themes--colors)))
  `(outline-5 :height 1.1 :foreground ,(nth 1 (nth 24 doom-themes--colors)))
  `(outline-6 :height 1.1 :foreground ,(nth 1 (nth 16 doom-themes--colors)))
  `(outline-7 :height 1.05 :foreground ,(nth 1 (nth 18 doom-themes--colors)))
  `(outline-8 :height 1.05 :foreground ,(nth 1 (nth 11 doom-themes--colors))))

(defun config/org-mode-init ()
  (setq olivetti-body-width 120)
  (olivetti-mode))

;;(use-package! visual-fill-column
;;  :hook (org-mode . config/org-mode-visual-fill))
(add-hook 'org-mode-hook #'config/org-mode-init)

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(use-package! org-modern
  :hook (org-mode . org-modern-mode)
  :config
  (setq
   ;; Edit settings
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t
   ;; Appearance
   org-modern-radio-target    '("❰" t "❱")
   org-modern-internal-target '("↪ " t "")
   org-modern-table nil
   org-modern-todo nil
   org-modern-tag nil
   org-modern-timestamp nil
   org-modern-statistics nil
   org-modern-progress nil
   org-modern-priority nil
   org-modern-horizontal-rule "──────────"
   org-modern-hide-stars "·"
   org-modern-star ["⁖"]
   org-modern-keyword "‣"
   org-modern-list '((43 . "•")
                     (45 . "–")
                     (42 . "↪"))
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-agenda-tags-column 0)
  (global-org-modern-mode))



(use-package! svg-tag-mode)

(add-hook! 'org-mode-hook 'svg-tag-mode)

(use-package! all-the-icons)

(defun config/agenda-init ()
    (olivetti-mode))

(after! org-agenda
  (setq org-agenda-files
        '("/home/sylvester/Documents/org/Agenda/agenda.org"
          "/home/sylvester/Documents/org/Agenda/personal.org"
          "/home/sylvester/Documents/org/Agenda/home.org"
          "/home/sylvester/Documents/org/Agenda/collage.org"
          "/home/sylvester/Documents/org/Agenda/dragonware.org"
          "/home/sylvester/Documents/org/Agenda/computer.org"))

  (setq org-agenda-span 1
        org-agenda-start-day "+0d")

  (custom-set-faces!
    '(org-agenda-date :inherit outline-1 :height 1.15)
    '(org-agenda-date-today :inherit diary :height 1.15)
    '(org-agenda-date-weekend :inherit outline-2 :height 1.15)
    '(org-agenda-date-weekend-today :inherit outline-4 :height 1.15)
    '(org-super-agenda-header  :box (:line-width 2 :color "black " :style pressed-button )  :weight bold :height 1.3))


  (setq org-agenda-current-span "")
  (setq org-agenda-time-grid '((dialy) () "" ""))
  (setq org-agenda-hide-tags-regexp ".*")

  (setq org-agenda-prefix-format
        '((agenda . "  %?-2i %t ")
          (todo . " %i %-12:c ")
          (tags . " %i %-12:c ")
          (search . " %i %-12:c ")))

)

(setq org-agenda-category-icon-alist
      `(("Home" ,(list (all-the-icons-faicon "home" :v-adjust 0.005)) nil nil :ascent center)
        ("Personal" ,(list (all-the-icons-faicon "user" :v-adjust 0.005)) nil nil :ascent center)
        ("Collage" ,(list (all-the-icons-faicon "graduation-cap" :v-adjust 0.005)) nil nil :ascent center )
        ("Dragonware" ,(list (all-the-icons-wicon "cloud" :v-adjust 0.005)) nil nil :ascent center )
        ("Computer" ,(list (all-the-icons-faicon "code" :v-adjust 0.005)) nil nil :ascent center )))


(use-package! org-super-agenda
  :config (org-super-agenda-mode t))

(setq org-super-agenda-groups
      '((:name "Overdue "
         :order 1
         :scheduled past
         :deadline past
         :face 'error)
        
        (:name " DeadLine "
         :deadline future
         :order 2
         :face 'error)
        
        (:name " Today "
          :file-path "agenda"
          :scheduled today
          :date today
          :order 3
          :face 'warning)
        
        (:name "Personal "
         :and(:file-path "personal" :not (:tag "event"))
         :order 4
         :face 'diary)
        
        (:name "Collage "
         :and(:file-path "collage" :not (:tag "event"))
         :order 4
         :face 'diary)
        
        (:name "Dragonware "
         :and(:file-path "dragonware" :not (:tag "event"))
         :order 4
         :face 'diary)
        
        (:name "Computer "
         :and(:file-path "computer" :not (:tag "event"))
         :order 4
         :face 'diary)
        
        (:name "Home "
         :and(:file-path "home" :not (:tag "event"))
         :order 4
         :face 'diary)
        
        
        
         
         ))
        
(add-hook! 'org-agenda-mode-hook 'config/agenda-init)

;; Place this in your ~/.doom.d/config.el
(after! org-roam
  ;; 1. Core Directory Setup
  (setq org-roam-directory (file-truename "~/Documents/org/roam"))
  (setq org-roam-db-autosync-mode t)

  ;; 2. Visuals: Making the node list look clean
  (setq org-roam-node-display-template "${title:60} 🏷️ ${tags:*}")

  ;; 3. Intelligent Capture Templates
  ;; These automatically file notes into subfolders based on the type
  (setq org-roam-capture-templates
        '(("d" "Default (General)" plain "%?"
           :target (file+head "general/%<%Y%m%d%H%M%S>-${slug}.org" 
                              "#+title: ${title}\n#+filetags: :draft:\n\n* Concepts\n")
           :unnarrowed t)
          ("c" "College" plain "%?"
 :target (file+head "college/%<%Y%m%d%H%M%S>-${slug}.org" 
                    "#+title: ${title}\n#+filetags: :college:lecture:\n\n* Course: %^{Course Name}\n* Lecture: %^{Lecture #}\n* Date: %t\n\n* Objectives\n* Notes\n%?\n* Summary & Questions")
 :unnarrowed t)
          ("p" "Programming/Dev" plain "%?"
           :target (file+head "coding/%<%Y%m%d%H%M%S>-${slug}.org" 
                              "#+title: ${title}\n#+filetags: :dev:concept:\n\n* Logic & Implementation\n#+begin_src %^{language}\n%?\n#+end_src")
           :unnarrowed t)))

  ;; 4. Integrated Search with Consult
  (use-package! consult-org-roam
    :init
    (consult-org-roam-mode 1)
    :config
    (setq consult-org-roam-grep-func #'consult-ripgrep)
    (setq consult-org-roam-buffer-narrow-key ?r)
    ;; Keybindings using Doom's 'map!' macro for consistency
    (map! :leader
          :prefix ("n" . "notes") ;; Access via 'SPC n'
          "f" #'consult-org-roam-file-find
          "b" #'consult-org-roam-backlinks
          "s" #'consult-org-roam-search
          "r" #'org-roam-node-insert
          "c" #'org-roam-capture)))

(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t       ; Matches your Emacs colors
        org-roam-ui-follow t           ; Graph focuses on the note you are writing
        org-roam-ui-update-on-save t   ; Live updates
        org-roam-ui-open-on-start nil)) ; Don't open browser until you ask

(defun config/presentation-start ()
  (setq text-scale-mode-amount 3)
  (setq olivetti-body-width 60)
  (read-only-mode)
  (openwith-mode 0 )
  (text-scale-mode 1))


(defun config/presentation-end ()
  (setq olivetti-body-width 120)
  (setq header-line-format nil)
  (read-only-mode)
  (openwith-mode 1 )
  (text-scale-mode 0))

(use-package! org-tree-slide
  :hook ((org-tree-slide-play . config/presentation-start)
         (org-tree-slide-stop . config/presentation-end))
  :custom
  (org-image-actual-width nil))





(use-package! nerd-icons-dired
  :hook
  (dired-mode . nerd-icons-dired-mode))

(require 'dired-x)
(setq dired-omit-files 
        (concat dired-omit-files "\\|^\\..*"))

(with-eval-after-load 'dired
  (require 'dired-x)
  (setq dired-guess-shell-alist-user
        '(("\\.mp4\\'" "mpv")
          ("\\.mkv\\'" "mpv")
          ("\\.png\\'" "imv")
          ("\\.jpg\\'" "imv")
          ("\\.jpeg\\'" "imv"))))

(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package! nerd-icons-ibuffer
  :ensure t
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(setq ibuffer-saved-filter-groups
      '(("default"
         ("Programming"   (predicate . (derived-mode-p 'prog-mode)))
         ("Org"           (mode . org-mode))
         ("Dired"         (mode . dired-mode))
         ("Magit"         (name . "^magit")))))

;; Exclude some buffers
(setq ibuffer-never-show-predicates
      '(;; System buffers
        "^\\*Messages\\*$"
        "^\\*scratch\\*$"
        "^\\*Completions\\*$"
        "^\\*Help\\*$"
        "^\\*Apropos\\*$"
        "^\\*info\\*$"
        "^\\*Async-native-compile-log\\*$"
        "^\\*Native-compile-log\\*$"

        ;; LSP Buffers
        "^\\*lsp-log\\*$"
        "^\\*clojure-lsp\\*$"
        "^\\*clojure-lsp::stderr\\*$"
        "^\\*ts-ls\\*$"
        "^\\*ts-ls::stderr\\*$"))

(setq ibuffer-formats
      '((mark " " (name 60 -1 :left))))

(use-package! awqat
  :commands (awqat-display-prayer-time-mode
             awqat-times-for-day)
  :config
  (setq calendar-latitude 32.377533
        calendar-longitude 15.092017
        awqat-mode-line-format " ${prayer} (${hours}h${minutes}m) "
        awqat-prayer-safety-offsets '(1.0 -1.0 4.0 0.0 4.0 1.0))
  (awqat-set-preset-umm-al-qura))

(use-package! olivetti
  :defer t
  :config
  (setq olivetti-style t))

(map! :leader
      :prefix "t"
      :desc "Toggle center content" "O" #'olivetti-mode)

(use-package! emms
  :bind
  (("<AudioPlay>" . emms-start)
   ("<AudioPause>" . emms-pause)))

(use-package! typst-ts-mode
  :custom
  (typst-ts-watch-options "--open")
  (typst-ts-mode-grammar-location (expand-file-name "tree-sitter/libtree-sitter-typst.so" user-emacs-directory))
  (typst-ts-mode-enable-raw-blocks-highlight t)
  :config
  (keymap-set typst-ts-mode-map "C-c C-c" #'typst-ts-tmenu)
  (add-to-list 'auto-mode-alist '("\.typ\'" . typst-ts-mode)))


(use-package! ox-typst
  :after org)

(use-package! lsp-mode  
  :config  
  ;; Register the language ID for your major mode  
  (add-to-list 'lsp-language-id-configuration '(typst-ts-mode . "tinymist"))  
    
  ;; Register the tinymist client  
  (lsp-register-client  
   (make-lsp-client  
    :new-connection (lsp-stdio-connection "tinymist")  
    :activation-fn (lsp-activate-on "tinymist")  
    :server-id 'tinymist)))

(add-hook! 'typst-ts-mode-hook #'lsp!)

(use-package! openwith
  :config
  (setq openwith-associations
        (list
         (list (openwith-make-extension-regexp
                '("mp3" "mp4"))
               "mpv"
               '(file))
         
         (list (openwith-make-extension-regexp
                '("png" "jpeg" "jpg" "gif"))
               "imv"
               '(file))
         
         (list (openwith-make-extension-regexp
                '("pdf"))
               "zathura"
               '(file))
         (list (openwith-make-extension-regexp
                '("pptx"))
               "firefox"
               '(file))

         ))
  (openwith-mode nil))

(setq lsp-rust-analyzer-linked-projects ["Cargo.toml"])

(use-package! ox-reveal)
(setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")
