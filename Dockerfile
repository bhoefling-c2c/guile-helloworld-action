FROM schemers/guile:3.0@sha256:430ba64ecf19d66aa976914e985f77192b73495c6dd4e41c46c481f59b3152ad

COPY hello.scm /hello.scm

ENTRYPOINT ["/usr/local/bin/scheme-banner", "--no-auto-compile", "--r6rs", "/hello.scm"]
