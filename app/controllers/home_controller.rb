class HomeController < ApplicationController
  def index
    @profile = Profile.last
    @user = @profile.user unless @profile.nil?
  end
end
