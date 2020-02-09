;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(unless (package-installed-p 'magit)
  (package-install 'magit))

(unless (package-installed-p 'helm)
  (package-install 'helm))

(require 'evil)
(evil-mode 1)

(with-eval-after-load 'evil-maps
    (define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
    (define-key evil-motion-state-map (kbd "<Space>") 'fzf)
    (define-key evil-motion-state-map (kbd "<C-f>") 'fzf))

(setq vc-follow-symlinks t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
