import discord, asyncdispatch

proc onReady(client: DiscordClient) {.async.} =
    echo "Logged in as " & client.username

proc onMessage(message: Message) {.async.} =
    if message.content == "!hello":
        await message.reply("Hello World!")

let client = newDiscordClient(token = "YOUR_BOT_TOKEN")
client.onReady = onReady
client.onMessage = onMessage
waitFor client.connect()
