#lang racket/gui

(provide
	menu%
)

(define menu%
  (class object%
    (field 
    	 ; New Main Menu frame
    	(frame
			(new (class frame%
					 ; Key event function
					(define/override (on-menu-char event)
						(cond [(eq? (send event get-key-code) 'escape) (close)])
					)
					(super-new)
				)

				[label "Main menu"]
				[width 200]
				[height 400]
				[alignment (list 'center 'center)]
			)
    	)

    	 ; Main Menu Label
    	(label (new message% [parent frame] [label "Main Menu"] [vert-margin 30]))

    	 ; New Game button
		 ; Calls generator and passes its result to main game loop
		(new-game
			(new button%
				[parent frame]
				[label "New Game"]
			    [callback (lambda (button event)
			        (void)
			    )]
			)
		)

		 ; Save Game button
 		 ; Calls save method and returns back to the game
 		(save-game
			(new button%
				[parent frame]
				[label "Save Game"]
			    [callback (lambda (button event)
			        (void)
			    )]
			)
		)

		 ; Load Game button
		 ; Calls loader and passes its result to main game loop
		(load-game
			(new button% 
				[parent frame]
				[label "Load Game"]
			    [callback (lambda (button event)
			        (void)
			    )]
			)
		)

		 ; Exit
		 ; Closes the game
		(exit-game 
			(new button% 
				[parent frame]
				[label "Exit"]
			    [callback (lambda (button event)
			    	(define exit? (message-box
			        	"Exit game"
			 	 		"Do you really want to exit? Your progress will not be saved."
			 	 		frame
			 	 		(list 'yes-no)
			 	 	))

			        (if (eq? exit? 'yes) 
			        	(exit #f)
			        #f)
			    )]
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