import net.dv8tion.jda.api.JDABuilder;
import net.dv8tion.jda.api.JDA;
import net.dv8tion.jda.api.events.message.guild.GuildMessageReceivedEvent;
import net.dv8tion.jda.api.hooks.ListenerAdapter;
import javax.security.auth.login.LoginException;

public class Bot extends ListenerAdapter {
    public static void main(String[] args) throws LoginException {
        JDA jda = JDABuilder.createDefault("YOUR_TOKEN_HERE").build();
        jda.addEventListener(new Bot());
    }

    @Override
    public void onGuildMessageReceived(GuildMessageReceivedEvent event) {
        String[] message = event.getMessage().getContentRaw().split("\\s+");
        if (message[0].equalsIgnoreCase("!hello")) {
            event.getChannel().sendMessage("Hello, world!").queue();
        }
    }
}
