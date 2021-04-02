class WelcomeController < ApplicationController
    def webhook
        render nothing: true, status: :ok
    end
end
