using Discord

const client = Discord.Client("YOUR_BOT_TOKEN_HERE")

function on_ready(client)
    println("Logged in as $(client.user)")
end

function on_message(client, message)
    if message.content == "!hello"
        Discord.send_message(message.channel, "Hello, world!")
    end
end

Discord.register_handler(client, "on_ready", on_ready)
Discord.register_handler(client, "on_message", on_message)

Discord.connect!(client)
