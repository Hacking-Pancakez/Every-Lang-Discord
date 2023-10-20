import discord.Discord;
import discord.Message;
import discord.MessageData;
import discord.MessageOptions;
import discord.User;
import discord.enums.ActivityType;
import discord.enums.StatusType;
import discord.haxe.Handler;

class Bot {
    static function main() {
        var discord = new Discord("YOUR_BOT_TOKEN_HERE");
        discord.onReady = function() {
            trace("Logged in as ${discord.user.username}#${discord.user.discriminator}");
            discord.updateStatus(StatusType.ONLINE, ActivityType.PLAYING, "with Haxe");
        };
        discord.onMessageCreate = function(message: Message) {
            if (message.content == "!hello") {
                var options = new MessageOptions();
                options.content = "Hello, world!";
                discord.createMessage(message.channel_id, options);
            }
        };
        discord.connect();
    }
}
