(require 'company)

(setq company-idle-delay 1)
(global-set-key (kbd "C-o") 'company-complete)



;(add-hook 'python-mode-hook 'anaconda-mode)

(global-company-mode)
;;dabbrev
;;(add-to-list 'company-dabbrev-code-modes 'shell-script-mode)
;;(setq company-dabbrev-ignore-case nil)
;;(setq company-dabbrev-downcase nil)

(message "init company end" )


