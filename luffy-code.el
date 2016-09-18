;;misc small stuff place...

;;general configuration

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(put 'upcase-region 'disabled nil)
(global-hl-line-mode t)
(column-number-mode t)
(setq make-backup-files nil)
(put 'dired-find-alternate-file 'disabled nil)
(setq ack-command "ack -H --nocolor --nogroup   ")




;;
(defun refresh ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer t t))



(defvar server-buffer-clients)
(when (and (fboundp 'server-start) (string-equal (getenv "TERM") 'xterm))
  (server-start)
  (defun fp-kill-server-with-buffer-routine ()
    (and server-buffer-clients (server-done)))
  (add-hook 'kill-buffer-hook 'fp-kill-server-with-buffer-routine))


;;dsvn

(require 'vc-svn)
(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)


(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
(global-set-key (kbd "C-x C-r") 'sudo-edit)

;;yaml
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;;imenu key
(global-set-key (kbd "C-x l") 'helm-imenu)

;;undo-tree
(require 'undo-tree)
(global-undo-tree-mode)
