(load "~/.emacs.d/my-loadpackages.el")
(add-hook 'after-init-hook '(lambda ()
  (load "~/.emacs.d/my-noexternals.el")
))
