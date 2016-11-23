#lang racket

(require "menu.rkt")

(define menu-gui (new menu%))

(send menu-gui show)

