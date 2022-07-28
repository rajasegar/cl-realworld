(in-package :cl-user)
(defpackage cl-realworld.web
  (:use :cl
        :caveman2
        :cl-realworld.config
        :cl-realworld.view
        :cl-realworld.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :cl-realworld.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (render #P"index.html"))

(defroute "/login" ()
  (render #P"login.html"))

;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
