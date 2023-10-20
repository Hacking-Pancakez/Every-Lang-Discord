#lang racket

(require racket/discord)

(define client (make-client "YOUR-BOT-TOKEN"))

(define (hello-world message)
    (when (string=? (message-content message) "!hello")
        (send-message (message-channel message) "Hello World")))

(register-event! client 'message-create hello-world)

(run-client client)
