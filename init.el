;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

;;configure for install packages
(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
     )
(require 'cl)
(defvar my/packages '(
		      monokai-theme
		      company
		      swiper
		      smex
		      hungry-delete
		      nodejs-repl
		      exec-path-from-shell
		      js2-mode
		      smartparens
		      counsel
		      html-script-src
		      ) "Default packages")
(setq package-selected-packages my/packages)
(defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))
(unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))



;;configure for package hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;;confi foe smex
(require 'smex)
(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)


;;configure for package swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
;;(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
;;(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)



;;configure for package smartparens
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)



;;configure for package smex
(require 'smex)
(smex-initialize)



;;configure for use system command
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))



;;configure for open js file whith js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;;configure for nodejs-repl
(require 'nodejs-repl)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(custom-set-variables
 ;; custom-set-variables was added by Customd
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.05)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default))))



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;configure when open emacs is fullscreen
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;;configure for disable toolbar
(tool-bar-mode -1)
;;configure for disable scrollbar
(scroll-bar-mode -1)
;;configure for display linenum
(global-linum-mode 1)
;;Set the selected line to highlight
(global-hl-line-mode 1)
;;configure for set the font size
(set-face-attribute 'default nil :height 160)


;;Automatic indentation after enter
(electric-indent-mode 1)



;;configure for Start automatic complete function model
(global-company-mode 1)



;;configure for When the file is selected, direct input can be deleted
(delete-selection-mode t)



;;show paren high light auto 
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


;;configure for load monokai theme
(load-theme 'monokai t)



;;configure for Changing the style of the cursor
(setq-default cursor-type 'bar)



;;configure for disable the help view when emacs opend
(setq inhibit-splash-screen 1)



;;configure for delete backupfile
(setq make-backup-files nil)



;;set the code high light
(require 'org)
(setq org-src-fontify-natively t)
(setq org-startup-indented t)
(setq org-agenda-files '("~/.emacs.d"))
(global-set-key (kbd "C-c a") 'org-agenda)



;;configure for open recent  files 
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)



(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)


(defun open-study-file()
  (interactive)
  (find-file "~/.emacs.d/day01.org"))
(global-set-key (kbd "<f3>") 'open-study-file)


(defun open-todayweb-study()
 (interactive) 
 (find-file "~/Documents/web开发/自学/javascript/jQuery/day_01.org"))
(global-set-key (kbd "<f4>") 'open-todayweb-study)


(defun open-nginx-file()
  (interactive)
  (find-file "~/Desktop/nginx_study01.org"))
(global-set-key (kbd "<f5>") 'open-nginx-file)
