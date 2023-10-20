defmodule MyBot do
    use Discord

    def start do
        token = "YOUR_BOT_TOKEN_HERE"
        client = Discord.Client.login(token)

        client
        |> on_ready(&on_ready/1)
        |> on_message_create(&on_message_create/1)
        |> run
    end

    def on_ready(_client) do
        IO.puts "Bot is ready!"
    end

    def on_message_create(message) do
        case message.content do
            "!hello" ->
                Discord.Message.reply(message, "Hello, world!")
            _ ->
                :ok
        end
    end
end

MyBot.start()
