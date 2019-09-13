(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(require 'evil)
(evil-mode 1)

(define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
 
(custom-set-variables
 '(package-selected-packages (quote (evil))))
 
(custom-set-faces
 )
