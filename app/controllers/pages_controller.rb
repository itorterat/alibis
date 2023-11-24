class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home; end

  def dashboard
    @alibis = current_user.alibis
    @bookings = current_user.bookings
  end
end
