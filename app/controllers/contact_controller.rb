class ContactController < ApplicationController
  public_actions :create, :index

  def create
    @contact_params = params.permit(:email, :message, :name, :subject).to_h

    if @contact_params[:message].blank?
      flash.now[:alert] = 'Please provide a message.'
      return render 'index'
    end

    if @contact_params[:email].present? && !valid_email?(@contact_params[:email])
      flash.now[:alert] = 'Please check your email address for correctness.'
      return render 'index'
    end

    customer_message = CustomerMessage.new @contact_params
    unless customer_message.save
      flash.now[:alert] = 'There was an error sending your message. Please try again later.'
      return render 'index'
    end

    ContactMailer.contact_email(@contact_params).deliver_later
    render 'thank-you'
  end

  def index
    @contact_params = {}
  end

  private

  def valid_email?(email)
    email.match(
      %r{
        \A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+
        @
        [a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?
        (?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+
        \z
      }x
    ).present?
  end
end
