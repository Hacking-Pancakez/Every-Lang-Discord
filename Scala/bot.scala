import sx.blah.discord.api.ClientBuilder
import sx.blah.discord.api.IDiscordClient
import sx.blah.discord.api.events.EventDispatcher
import sx.blah.discord.api.events.IListener
import sx.blah.discord.handle.impl.events.guild.channel.message.MessageReceivedEvent
import sx.blah.discord.handle.obj.ActivityType
import sx.blah.discord.handle.obj.StatusType

object Bot {
    def main(args: Array[String]): Unit = {
        val token = "YOUR_BOT_TOKEN_HERE"
        val client = new ClientBuilder().withToken(token).build()
        val dispatcher = client.getDispatcher()
        val listener = new MessageListener()
        dispatcher.registerListener(listener)
        client.login()
        client.changePresence(StatusType.ONLINE, ActivityType.PLAYING, "!hello")
    }
}

class MessageListener extends IListener[MessageReceivedEvent] {
    override def handle(event: MessageReceivedEvent): Unit = {
        val message = event.getMessage()
        val content = message.getContent()
        if (content == "!hello") {
            message.getChannel().sendMessage("Hello, world!")
        }
    }
}
