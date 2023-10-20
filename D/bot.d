import discord;
import std.stdio;

void main(string[] args)
{
    auto client = new DiscordClient("YOUR_BOT_TOKEN_HERE");

    client.onMessage((message) {
        if (message.content == "!hello") {
            message.reply("Hello, world!");
        }
    });

    client.run();
}
