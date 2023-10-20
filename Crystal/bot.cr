require "discord"

client = Discord::Bot.new(token: "YOUR_TOKEN_HERE")

client.on_message do |event|
    if event.content.starts_with?("!hello")
        event.respond "hello world"
    end
end

client.run
