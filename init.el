;; load-pathを追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; load-pathでディレクトリとそのサブディレクトリを追加
(add-to-load-path "elisp" "conf" "public_repos")

;; "C-t"でウィンドウを切り替える
(define-key global-map (kbd "C-t") 'other-window)

;; "M-g"でgoto-line
(define-key global-map (kbd "M-g") (lambda (x) (interactive "nLine: ") (goto-line x)))

;; 行番号を表示する
(global-linum-mode t)

;; 対応するカッコを強調表示
(show-paren-mode t)
(put 'upcase-region 'disabled nil)
