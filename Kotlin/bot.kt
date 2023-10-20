import net.dv8tion.jda.api.JDABuilder
import net.dv8tion.jda.api.events.message.MessageReceivedEvent
import net.dv8tion.jda.api.hooks.ListenerAdapter
import javax.security.auth.login.LoginException

class Bot : ListenerAdapter() {
    override fun onMessageReceived(event: MessageReceivedEvent) {
        if (event.message.contentRaw == "!hello") {
            event.channel.sendMessage("Hello, world!").queue()
        }
    }
}

fun main() {
    val token = "YOUR_BOT_TOKEN_HERE"
    try {
        val jda = JDABuilder.createDefault(token)
            .addEventListeners(Bot())
            .build()
        jda.awaitReady()
    } catch (e: LoginException) {
        e.printStackTrace()
    }
}
