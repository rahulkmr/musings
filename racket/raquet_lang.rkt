(module raquet racket
  (provide (except-out (all-from-out racket) lambda)
           (rename-out [lambda fn])))
