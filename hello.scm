(define name
  (let* ((env-name "INPUT_NAME")
	 (name (or (getenv env-name) "World")))
    name))

;; See for more actions:
;; https://docs.github.com/en/actions/reference/workflow-commands-for-github-actions#setting-an-output-parameter

(define (write-output var value)
  "Writes the content of an output variable to the log"
  (format #t "::set-output name=~a::~a~%" var value))

(define (debug-msg msg)
  "Outputs a debug message. In order to see these,
a secret ACTIONS_STEP_DEBUG=true has to be defined in your repo."
  (format #t "::debug::~a~%" msg))

(define (simple-warning msg)
;; ::warning file={name},line={line},col={col}::{message}
(format #t "::warning ::~a~%" msg))

(let ((greeting (string-append "Hello, " name "!")))
  (debug-msg "This is a debug message")
  (simple-warning "This is a warning without file context")
  (format #t "~a~%" greeting)
  (write-output "full-greeting" greeting))
