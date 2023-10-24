# class ChatController < ApplicationController
#     def index
#         @chat_service = ChatService.new('')
#         @chat_service.call
#     end

#     def create
#         user_input = params[:user_input]
#         @chat_service = ChatService.new(user_input)
#         @chat_service.call
    
#         respond_to do |format|
#           format.js
#         end
#     end
# end

# app/controllers/chat_controller.rb

# app/controllers/chat_controller.rb

class ChatController < ApplicationController
    def index
    end
  
    def chat
      user_input = params[:user_input]
      chat_service = ChatService.new
      response = chat_service.call(user_input)
  
      render json: { response: response }
    end
end
  
  