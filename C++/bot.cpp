#include <iostream>
#include <string>
#include <cstdlib>
#include <discordcpp/restapi.hpp>
#include <discordcpp/gateway.hpp>
#include <discordcpp/client.hpp>

using namespace discordcpp;

int main(int argc, char* argv[]) {
    if (argc != 2) {
        std::cerr << "Usage: " << argv[0] << " <bot token>" << std::endl;
        return 1;
    }

    std::string token = argv[1];
    client bot(token);

    bot.on_message([&bot](const message& msg) {
        if (msg.content == "!hello") {
            bot.create_message(msg.channel_id, "Hello, " + msg.author.username + "!");
        }
    });

    bot.run();

    return 0;
}
