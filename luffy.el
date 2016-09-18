;;elpa sites
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")))


;; my download elisp packages path
(add-to-list 'load-path "/home/xianyang/.emacs.d/userlib/")
(add-to-list 'load-path "/home/xianyang/.emacs.d/userlib/git-emacs")


;; sub directories

(load-library "luffy-helm")
(load-library "luffy-theme")
(load-library "luffy-code")
;(load-library "luffy-flycheck")
(load-library "luffy-python-def")
(load-library "luffy_new")

(require 'flymd)
(defun my-flymd-browser-function (url)
  (let ((browse-url-browser-function 'browse-url-firefox))
    (browse-url url)))
(setq flymd-browser-open-function 'my-flymd-browser-function)

;; (when (executable-find "ipython") (setq python-shell-interpreter "ipython") 

