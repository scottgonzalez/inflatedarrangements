class HomeController < ApplicationController
  layout 'home'

  public_actions :index

  def self.featured_photo
    if @featured_photo_timestamp.nil? || @featured_photo_timestamp < 5.minutes.ago
      @featured_photo = Photo.where(feature: true).order('RANDOM()').limit(1).first
      @featured_photo_timestamp = Time.zone.now
    end

    @featured_photo
  end

  def index
    @photo = self.class.featured_photo
  end
end
