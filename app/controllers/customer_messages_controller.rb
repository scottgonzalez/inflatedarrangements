class CustomerMessagesController < ApplicationController
  def index
    @customer_messages = CustomerMessage.all
  end

  def show
    @customer_message = CustomerMessage.find params[:id]
  end
end
