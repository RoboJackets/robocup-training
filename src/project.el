
(require 'ox-publish)

(setq org-publish-project-alist
  '(("rc-slides"
      :base-directory "."
      :publishing-directory "../slides/"
      :publishing-function org-reveal-publish-to-reveal
      :exclude-tags ("docs"))
     ("rc-docs"
       :base-directory "."
       :publishing-directory "../docs/"
       :publishing-function org-md-publish-to-md
       :exclude-tags ("slides")
       )))

(defun my-org-publish ()
  (interactive)
  (org-publish-all))
