using Discord;
using Discord.Commands;
using Discord.WebSocket;
using System;
using System.Threading.Tasks;

public class Program
{
    private DiscordSocketClient _client;
    private CommandService _commands;

    static void Main(string[] args)
        => new Program().MainAsync().GetAwaiter().GetResult();

    public async Task MainAsync()
    {
        _client = new DiscordSocketClient();
        _commands = new CommandService();

        // Register the command handler
        _client.MessageReceived += HandleCommandAsync;

        // Login and connect to Discord
        string token = "YOUR_BOT_TOKEN_HERE";
        await _client.LoginAsync(TokenType.Bot, token);
        await _client.StartAsync();

        // Block this task until the program is closed
        await Task.Delay(-1);
    }

    private async Task HandleCommandAsync(SocketMessage messageParam)
    {
        // Ignore system messages and messages from bots
        var message = messageParam as SocketUserMessage;
        if (message == null || message.Author.IsBot) return;

        // Check if the message starts with the command prefix
        int argPos = 0;
        if (message.HasStringPrefix("!", ref argPos))
        {
            // Execute the command
            var context = new SocketCommandContext(_client, message);
            var result = await _commands.ExecuteAsync(context, argPos, null);

            // If the command failed, log the error
            if (!result.IsSuccess)
            {
                Console.WriteLine(result.ErrorReason);
            }
        }
    }

    // Define the !hello command
    [Command("hello")]
    public async Task HelloCommand()
    {
        await ReplyAsync("Hello, world!");
    }
}
