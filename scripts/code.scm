
	(define (make_list L)
	;makes a list containing list into a list of just atoms
    (cond
      ((pair? L)		(append (car L) (make_list (cdr L))))
      (else				L)))
	  
	
	(define (check_doubles L currentItem currentList)
	;checks to see if all of the elements in the list are unique. L should be the List, and current item should be the car of that list, and currentList should be the cdr of that list
	(cond
		((equal? (car currentList) currentItem)		#f)
		(not(null? currentItem)			 (check_doubles currentItem (cdr currentList) L ))
		(not(null? currentList)			 (check_doubles (cadr L) (cdr L) (cdr L)))
		(else				#t)))
	
	
	 
	
	(make_list   '(
	(Park Dunbar Khan Lloyd)
	(Bashir Trivedi Ramos Franklin)
	(Schmidt Nakamura Andrews Chen)
	(Evans Goldberg)))
	
	
	

	
	
	
	(define L '(1))

	
	(check_doubles L (car L) (cdr L))
	
	
	
	
	
	
	
	
	


(jobs_ok?
   '(
	(Park Dunbar Khan Lloyd)
	(Bashir Trivedi Ramos Franklin)
	(Schmidt Nakamura Andrews Chen)
	(Evans Goldberg Macmillan Ortiz))
   '(
	(Andrews 1 1 1)
	(Bashir 1 1 1)
	(Chen 1 1 1)
	(Dunbar 1 1 1)
	(Evans 1 1 1)
	(Franklin 1 1 1)
	(Goldberg 1 1 1)
	(Jefferson 1 1 1)
	(Khan 1 1 1)
	(Lloyd 1 1 1)
	(Macmillan 1 1 1)
	(Nakamura 1 1 1)
	(Ortiz 1 1 1)
	(Park 1 1 1)
	(Ramos 1 1 1)
	(Schmidt 1 1 1)
	(Trivedi 1 1 1)))
	
	

	