(require-package 'php-mode)
(require-package 'smarty-mode)
(require-package 'web-mode)

(defun my-setup-php ()
  (require 'flycheck)
  (flycheck-define-checker my-php
    "A PHP syntax checker using the PHP command line interpreter.
     See URL `http://php.net/manual/en/features.commandline.php'."
    :command ("php" "-l" "-d" "error_reporting=E_ALL" "-d" "display_errors=1"
              "-d" "log_errors=0" source)
    :error-patterns
    ((error line-start (or "Parse" "Fatal" "syntax") " error" (any ":" ",") " "
            (message) " in " (file-name) " on line " line line-end))
    :modes (php-mode php+-mode web-mode))
  (web-mode)
  (add-to-list 'web-mode-ac-sources-alist
               '("php" ac-source-words-in-buffer
                 ac-source-words-in-same-mode-buffers
                 ac-source-dictionary))
  (flycheck-select-checker 'my-php)
  (flycheck-mode t))

(add-to-list 'auto-mode-alist '("\\.php$" . my-setup-php))

(provide 'init-php)
