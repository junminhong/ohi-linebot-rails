class WelcomeController < ApplicationController
	def webhook
		reply_token = params['events'][0]['replyToken']

    response_message = {
      type: "text",
      text: params["events"].first["message"]["text"]
    }

    client.reply_message(reply_token, response_message)
		# render nothing: true, status: :ok
	end
	
	def client
		@client ||= Line::Bot::Client.new { |config|
			config.channel_id = ENV["LINE_CHANNEL_ID"]
			config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
			config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
		}
	end
end
