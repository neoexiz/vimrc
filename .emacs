;;Load auctex
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;;set xelatex as default editor
(add-hook 'LaTeX-mode-hook
(lambda()
(add-to-list 'TeX-command-list'("XeLaTeX""%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
(setq TeX-command-default "XeLaTeX")))

;;set evince as pdf viewer
(setq TeX-output-view-style (quote(("^pdf$"".""evince %o %(outpage)"))))

;;Install markdown-mode
(require 'package)
(add-to-list 	'package-archives
		'("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
(use-package markdown-mode
	     :ensure t
	     :commands (markdown-mode gfm-mode)
	     :mode (("README\\.md\\'" . gfm-mode)
		    ("\\.md\\'" . markdown-mode)
		    ("\\.markdown\\'" . markdown-mode))
	     :init (setq markdown-command "multimarkdown"))

