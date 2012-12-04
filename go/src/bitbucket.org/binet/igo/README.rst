igo
===

A simple interactive Go interpreter built on top of go-eval with some readline refinements

Note
----

You'll need the go-readline bindings from
https://bitbucket.org/binet/go-readline

and the go-eval package from https://bitbucket.org/binet/go-eval

(both are go-get-able)


Installation
------------

Installing ``igo`` is as simple as::

   $ go get bitbucket.org/binet/igo


Example
-------

::

  $ igo
  igo> func f() { println("hello world") }
  igo> f()
  hello world

Documentation
-------------

Available through go-pkg-doc:

http://go.pkgdoc.org/bitbucket.org/binet/igo


TODO
----

- investigate the replacement of readline with linenoise (or go-linoise?)

- implement code completion

  - with rlcompleter

  - with linenoise

  - with gocode

- code colorization ?

