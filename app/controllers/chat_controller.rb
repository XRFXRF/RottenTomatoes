class ChatController < ApplicationController
    def index
        @chat_service = ChatService.new('')
        @chat_service.call
    end

    def create
        user_input = params[:user_input]
        @chat_service = ChatService.new(user_input)
        @chat_service.call
    
        respond_to do |format|
          format.js
        end
    end
end
