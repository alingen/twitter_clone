class HomeController < ApplicationController
  def top
    @tweets = Tweet.all.order(created_at: :desc)
  end
end
