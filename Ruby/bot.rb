require 'discordrb'

bot = Discordrb::Commands::CommandBot.new(
  token: 'YOUR_TOKEN_HERE',
  client_id: YOUR_CLIENT_ID_HERE,
  prefix: '!'
)

bot.command :hello do |event|
  event.respond 'Hello World!'
end

bot.run
