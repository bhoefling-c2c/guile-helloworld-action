(define name
  (let* ((env-name "INPUT_NAME")
	 (name (or (getenv env-name) "World")))
    name))

(define (write-output var value)
  "Writes the content of an output variable to the log"
  (format #t "::set-output name=~a::~a~%" var value))

(let ((greeting (string-append "Hello, " name "!")))
  (format #t "::debug::~a~%" "This is a debug message")
  (format #t "~a~%" greeting)
  (write-output "full-greeting" greeting))

