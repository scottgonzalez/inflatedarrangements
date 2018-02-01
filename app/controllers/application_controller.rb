class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate, except: [:not_found]

  class << self
    attr_reader :_public_actions

    def inherited(klass)
      klass.class_eval do
        @_public_actions = []
      end
    end

    def public_actions(*actions)
      @_public_actions.concat actions
    end
  end

  protected

  def authenticate
    authorized = public_action? || (authenticate_with_http_basic do |user, password|
      password == ENV.fetch('ADMIN_PASSWORD')
    end)

    request_http_basic_authentication unless authorized
  end

  def public_action?
    self.class._public_actions.include? params[:action].to_sym
  end
end
