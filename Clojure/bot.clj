(ns bot
    (:require [discord.client :as discord]))

(defn on-message [client [message]]
    (let [content (discord/message-content message)
                channel (discord/message-channel message)]
        (when (= "!hello" content)
            (discord/send-message! client channel "Hello, world!"))))

(defn start-bot [token]
    (let [client (discord/client {:token token})]
        (discord/register-handler! client :message on-message)
        (discord/start! client)))

(start-bot "YOUR_BOT_TOKEN_HERE")
