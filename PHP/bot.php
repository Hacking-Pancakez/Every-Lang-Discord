require_once __DIR__ . '/vendor/autoload.php';

use Discord\Discord;
use Discord\Parts\Channel\Message;

$discord = new Discord([
    'token' => 'YOUR_DISCORD_BOT_TOKEN_HERE',
]);

$discord->on('ready', function ($discord) {
    echo "Bot is ready!", PHP_EOL;
});

$discord->on('message', function (Message $message, Discord $discord) {
    if ($message->content == '!hello') {
        $message->reply('Hello, world!');
    }
});

$discord->run();
