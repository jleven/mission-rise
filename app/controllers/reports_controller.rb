class ReportsController < ApplicationController
  def show
    @cal_works = Eligible::CalWorks.new(session[:user_id]).eligible?
    @cal_fresh = Eligible::CalFresh.new(session[:user_id]).eligible?
  end
end
