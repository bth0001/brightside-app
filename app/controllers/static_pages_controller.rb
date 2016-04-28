class StaticPagesController < ApplicationController

  def home
    redirect_to brightsides_path if signed_in?
  end

  def about
  end
end
