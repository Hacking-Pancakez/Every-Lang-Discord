{-# LANGUAGE OverloadedStrings #-}

import Discord
import Discord.Types
import qualified Discord.Requests as R
import Control.Monad.IO.Class (liftIO)
import Data.Text (pack)

-- | The main entry point for the bot.
main :: IO ()
main = do
    -- Replace "YOUR_TOKEN_HERE" with your bot's token.
    userFacingError <- runDiscord $ def { discordToken = "YOUR_TOKEN_HERE"
                                                                            , discordOnStart = onStart
                                                                            , discordOnEnd = onEnd
                                                                            , discordOnEvent = onEvent
                                                                            }
    putStrLn userFacingError

-- | Called when the bot starts up.
onStart :: DiscordHandle -> IO ()
onStart _ = putStrLn "Bot started!"

-- | Called when the bot shuts down.
onEnd :: DiscordHandle -> IO ()
onEnd _ = putStrLn "Bot shutting down..."

-- | Called when the bot receives an event.
onEvent :: DiscordHandle -> Event -> IO ()
onEvent dis event = case event of
    -- Respond to messages in channels.
    MessageCreate m -> when (not (fromBot m) && isCommand m) $ do
        let cmd = getCommand m
        case cmd of
            "hello" -> sendMessage dis (messageChannel m) "Hello, world!"
            _ -> pure ()
    _ -> pure ()

-- | Returns True if the message is a command.
isCommand :: Message -> Bool
isCommand m = case messageText m of
    Just t -> "!hello" `isPrefixOf` t
    Nothing -> False

-- | Returns the command name from a message.
getCommand :: Message -> String
getCommand m = case messageText m of
    Just t -> drop 1 $ unpack t
    Nothing -> ""

-- | Returns True if the message was sent by a bot.
fromBot :: Message -> Bool
fromBot = userIsBot . messageAuthor

-- | Sends a message to a channel.
sendMessage :: DiscordHandle -> ChannelId -> String -> IO ()
sendMessage dis channel msg = do
    _ <- restCall dis (R.CreateMessage channel (pack msg))
    pure ()
