# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(id: params[:id])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:danger] = 'Improper credentials provided'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
