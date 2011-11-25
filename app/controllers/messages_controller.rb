class MessagesController < ApplicationController
  
  def new
    @message = Message.new_message
  end
  
  def index
    @messages = if params[:node]
      Message.get_by_node(params[:node])
    else
      Message.get_messages
    end
  end

  def show
    @message = Message.get_by_key(params[:id])
  end
  
end
