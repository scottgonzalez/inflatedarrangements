class HomeController < ApplicationController
  layout 'home'

  public_actions :index

  def index
    @photo = Photo.where(feature: true).order('RANDOM()').limit(1).first
  end
end
