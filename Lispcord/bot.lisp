
;; Load the discord library
(ql:quickload :discord)

;; Define the bot token
(defparameter *token* "YOUR_BOT_TOKEN_HERE")

;; Create a new discord client
(defparameter *client* (discord:make-client *token*))

;; Define the !hello command
(defun hello-command (message)
    (discord:send-message (discord:message-channel message) "Hello, world!"))

;; Register the !hello command
(discord:register-command *client* "!hello" 'hello-command)

;; Start the bot
(discord:start *client*)
