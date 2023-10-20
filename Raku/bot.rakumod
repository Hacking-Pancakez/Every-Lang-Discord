use v6;
use Discord::Client;

my $client = Discord::Client.new(token => "YOUR_BOT_TOKEN_HERE");

$client.on-message: sub ($message) {
    if $message.content eq '!hello' {
        $message.channel.send-message("Hello World!");
    }
}

$client.run;
