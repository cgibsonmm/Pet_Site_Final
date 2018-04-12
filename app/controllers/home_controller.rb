class HomeController < ApplicationController
  def index
    @post = PhotoPost.all
  end
end
