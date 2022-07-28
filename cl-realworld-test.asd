(defsystem "cl-realworld-test"
  :defsystem-depends-on ("prove-asdf")
  :author "Rajasegar Chandran"
  :license ""
  :depends-on ("cl-realworld"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "cl-realworld"))))
  :description "Test system for cl-realworld"
  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
