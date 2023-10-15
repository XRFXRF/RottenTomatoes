class QuestionsController < ApplicationController
    def index
    end
  
    def create
      @answer = "I don't know."
    end
  
    private
  
    def question
      params[:question][:question]
    end

    def call
      message_to_chat_api(<<~CONTENT)
        Answer the question based on the context below, and
        if the question can't be answered based on the context,
        say \"I don't know\".
  
        Context:
        #{context}
  
        ---
  
        Question: #{question}
      CONTENT
    end
  
    private

    def message_to_chat_api(message_content)
      response = openai_client.chat(parameters: {
        model: 'gpt-3.5-turbo',
        messages: [{ role: 'user', content: message_content }],
        temperature: 0.5
      })
      response.dig('choices', 0, 'message', 'content')
    end

    def openai_client
      @openai_client ||= OpenAI::Client.new(access_token: Rails.application.credentials.open_ai_api_key)
    end
end
