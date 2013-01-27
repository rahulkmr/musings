#lang racket/base
(require ffi/unsafe
         ffi/unsafe/define)
 
(define-ffi-definer define-curses (ffi-lib "libcurses"))

(define-curses _WINDOW-pointer (_cpointer 'WINDOW))
(define-curses initscr (_fun -> _WINDOW-pointer))
(define-curses waddstr (_fun _WINDOW-pointer _string -> _int))
(define-curses wrefresh (_fun _WINDOW-pointer -> _int))
(define-curses endwin (_fun -> _int))

(define win (initscr))
(void (waddstr win "Hello"))
(void (wrefresh win))
(sleep 1)
(void (endwin))
