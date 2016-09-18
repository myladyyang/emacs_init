;;; package --- Summary:
;;try to use use-package instead of my old config
;;The new structure is :
;;1. lazy load package definition and configuration
;;; Commentary:
;;; Code:
;;; load path

;;elpa sites
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")))


;; my download elisp packages path
(add-to-list 'load-path "/home/xianyang/.emacs.d/userlib/")


(defvar luffy_new-init_dir_path "~/.emacs.d/init/")
(add-to-list 'load-path 'luffy_new-init_dir_path)
(add-to-list 'load-path (concat luffy_new-init_dir_path "helm"))


(use-package flycheck
  :ensure t
  :bind (:map flycheck-mode-map
	      ("C-h" . helm-flycheck))
  :init (global-flycheck-mode)
  :config (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(use-package psvn
  :ensure t
  :defer t)

(use-package company
  :ensure t
  :init (global-company-mode)
  :bind (:map company-mode-map
	      ("C-o" . company-complete))
  :config
  (setq company-idle-delay 1)
  
  (defun luffy-python-anaconda-mode-hook ()
    (add-to-list 'company-backends 'company-anaconda)
    (anaconda-mode)
    (add-to-list 'python-shell-extra-pythonpaths "/usr/lib/python2.7/site-packages/")
    (add-to-list 'python-shell-extra-pythonpaths "/home/xianyang/luffy_dev/Q3HelpToolSet/logAnalyze/")
    (eldoc-mode)
    (setenv "NO_PROXY" "127.0.0.1")
    (setenv "no_proxy" "127.0.0.1")
    ;; (setq python-shell-interpreter "ipython")
    ;; (setq python-shell-interpreter-args "--pylab")
    )

  (defun luffy-csharp-mode-hook()
    (add-to-list 'company-backends 'company-omnisharp)
    (setenv "NO_PROXY" "127.0.0.1,localhost")
    (setenv "no_proxy" "127.0.0.1,localhost")
    (message "add company backend for omn")

    )

  ;;(add-hook 'python-mode-hook 'luffy-python-anaconda-mode-hook)
  (add-hook 'python-mode-hook 'luffy-python-anaconda-mode-hook)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  (add-hook 'csharp-mode-hook 'luffy-csharp-mode-hook)
  
  )




(use-package smartparens
  :ensure t
  :init
  (smartparens-global-mode)
  :config
  (require 'smartparens-config))

(use-package yaml-mode
  :ensure t
  :init (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode t))

(use-package yasnippet
  :ensure t
  :init (yas-global-mode 1))

 (use-package helm
   :ensure t
;   :init (add-to-list 'load-path (concat luffy_new-init_dir_path "helm"))
   :config
   (load-library "luffy-helm"))

(use-package helm-fuzzier
  :ensure t
  :config
  (helm-fuzzier-mode 1)
  (setq helm-M-x-fuzzy-match t))

(use-package virtualenvwrapper
  :ensure t
  :config
  (venv-initialize-interactive-shells)  
  (venv-initialize-eshell) 
  (setq venv-location "/home/xianyang/luffy_dev/Q3HelpToolSet/logAnalyze/")

  )

(use-package omnisharp
  :bind ("M-." . omnisharp-helm-find-symbols)
  :init
  (add-hook 'csharp-mode-hook 'omnisharp-mode)
  (message "load omni")
  (setq omnisharp-server-executable-path "/home/xianyang/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")
  
  )

(use-package pytest
  :ensure t
  :bind ("C-x t" . pytest-all)
  :init (require 'pytest)
  :config
  (setq pytest-cmd-flags "-x -s"))

(use-package py-smart-operator
  :init (add-hook 'python-mode-hook 'py-smart-operator-mode))

    

;;;theme
(load-theme 'ample t t)
(load-theme 'hydandata-light)
(enable-theme 'hydandata-light)
;;;(enable-theme 'ample)


;;;my own customize
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(put 'upcase-region 'disabled nil)
(global-hl-line-mode t)
(column-number-mode t)
(setq make-backup-files nil)
(put 'dired-find-alternate-file 'disabled nil)
(setq ack-command "ack -H --nocolor --nogroup   ")



(defun my-flymd-browser-function (url)
  (let ((browse-url-browser-function 'browse-url-firefox))
    (browse-url url)))
(setq flymd-browser-open-function 'my-flymd-browser-function)

(defun refresh ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer t t))

(global-set-key (kbd "<f5>") 'refresh)
(global-set-key (kbd "M-o") 'other-window)

(defun disable-proxy ()
  (interactive)
  (setenv "NO_PROXY" "127.0.0.1")
  (setenv "no_proxy" "127.0.0.1")
  )
(disable-proxy)
(provide 'luffy_new)
