import Discord from 'discord.js';

const client = new Discord.Client();

client.on('ready', () => {
    console.log(`Logged in as ${client.user?.tag}!`);
});

client.on('message', (msg) => {
    if (msg.content === '!hello') {
        msg.reply('Hello, world!');
    }
});

client.login('your-bot-token-goes-here');
