class ReportsController < ApplicationController
  def show
    @cal_works = Eligible::CalWorks.new(session[:user_id]).eligible?
    render text: @cal_works
  end
end
