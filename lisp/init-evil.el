(require-package 'evil)
(require-package 'key-chord)

(evil-mode 1)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

(provide 'init-evil)
