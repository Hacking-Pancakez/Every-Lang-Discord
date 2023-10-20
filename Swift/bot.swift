import Discord

let client = Discord.Client(token: "YOUR_BOT_TOKEN")

client.onMessageCreate = { data in
    if let message = data as? Discord.Message, message.content == "!hello" {
        message.reply(with: "Hello, world!")
    }
}

client.connect()
