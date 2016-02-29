
;;下の変なの消す
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;;
;; init.el
;;

;;==========================================基本=======================================
;; Language
(set-language-environment 'Japanese)

;; Coding system.
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Package Manegement
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
;;=====================================================================================

;;===============================ハイライト関係==========================================
(global-hl-line-mode t)                   ;; 現在行をハイライト
(show-paren-mode t)                       ;; 対応する括弧をハイライト
(setq show-paren-style 'mixed)            ;; 括弧のハイライトの設定。
(transient-mark-mode t)                   ;; 選択範囲をハイライト

;;
;; volatile-highlights
;;
(require 'volatile-highlights)
(volatile-highlights-mode t)
;;=====================================================================================


;;================================flymake==============================================
;; c / c++
(require 'flymake)

(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "g++" (list "-std=c++11" "-Wall" "-Wextra" "-fsyntax-only" local-file))))

(defun flymake-c-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "gcc" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))


(push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)
(push '("\\.cc$" flymake-cc-init) flymake-allowed-file-name-masks)
(push '("\\.c$" flymake-c-init) flymake-allowed-file-name-masks)

(add-hook 'c++-mode-hook
          '(lambda ()
             (flymake-mode t)))
(add-hook 'c-mode-hook
          '(lambda ()
             (flymake-mode t)))

;;======================================================================================


;;=============================== php mode =============================================
;;php-mode
(require 'php-mode)
;;======================================================================================

;;================================flycheck==============================================
(require 'flycheck)
;; Python
(add-hook 'python-mode-hook 'flycheck-mode)
;; Ruby
(add-hook 'ruby-mode-hook 'flycheck-mode)
;; php
(add-hook 'php-mode-hook 'flycheck-mode)
;;=====================================================================================

