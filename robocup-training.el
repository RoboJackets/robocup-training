;;; robocup-training.el --- generation scripts for robocup-training

;; Copyright (C) 2016-2017 Jay Kamat
;; Author: Jay Kamat <jaygkamat@gmail.com>
;; Version: 1.0
;; Keywords: robocup,training,revealjs
;; URL: https://github.com/RoboJackets/robocup-training
;; Package-Requires: ((emacs "25.0") (ox-gfm) (htmlize) (ox-reveal))
;;; Commentary:
;;; Creates and builds org project files for robocup training.

(require 'ox-reveal)
(require 'ox-publish)
(require 'ox-gfm)

;;; Code:

(let ((proj-base (file-name-directory load-file-name)))
  (setq org-publish-project-alist
    `(("rc-slides"
        :base-directory ,(concat proj-base "./src")
        :publishing-directory ,(concat proj-base "/slides/")
        :publishing-function org-reveal-publish-to-reveal
        :exclude-tags ("docs"))
       ("rc-docs"
         :base-directory ,(concat proj-base "./src")
         :publishing-directory ,(concat proj-base "/docs/")
         :publishing-function org-gfm-publish-to-gfm
         :exclude-tags ("slides")))
    org-reveal-root "https://cdn.jsdelivr.net/reveal.js/3.0.0/"
    org-reveal-margin "0.22"))


(defun my-org-publish ()
	"Overwrite's my (jay's) personal publishing file to publish everything.
Also provides a script to run to publish this project."
  (interactive)
	;; Don't make backup files when generating (cask)
	(let ((make-backup-files nil))
		(org-publish-all t)))

(require 'ob-python)
(setq org-babel-python-command "python3")
;; Make indentation actually matter in org src blocks
(setq org-src-preserve-indentation t)

;; Don't ask for evaluation
(defun my-org-confirm-babel-evaluate (lang body)
	(not (string= lang "python"))) 
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

(provide 'robocup-training)

;;; robocup-training.el ends here
