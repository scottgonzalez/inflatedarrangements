class HomeController < ApplicationController
  layout 'home'

  public_actions :index

  def index
    @photo = Photo.find 15
  end
end
