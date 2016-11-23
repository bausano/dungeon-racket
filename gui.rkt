#lang racket/gui

(provide
	menu%
)

(define game%
  (class object%
    (field
    	 ; New Main Menu frame
    	(frame
			(new frame% 
				[label "Dungeon game"]
				[width 800]
				[height 900]
				[alignment (list 'center 'center)]
				[stretchable-width #f]
   	 			[stretchable-height #f]
			)
    	)
    )
   
    (define/public (close)
      (send frame show #f)
    )

    (define/public (show)
      (send frame show #t)
    )

    (super-new)
  )
)