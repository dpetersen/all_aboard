class LoginsController < ApplicationController
  def show
  end

  def create
    session[:logged_in] = true
    render :show
  end

  def destroy
    session[:logged_in] = nil
    render :show
  end
end
