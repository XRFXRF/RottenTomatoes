class ChatboxsController < ApplicationController
    def index
    end
  
    def create
      @answer = "I don't know."
    end
  
    private
  
    def question
      params[:question][:question]
    end
end
