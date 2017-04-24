class InterestsController < ApplicationController
  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params)
    @signup.save
    render action: :new
  end

  private

  def signup_params
    params[:signup] ||= {}
    params[:signup][:campaign] = 'interest'
    params.require(:signup).permit(:email, :name, :campaign)
  end
end
