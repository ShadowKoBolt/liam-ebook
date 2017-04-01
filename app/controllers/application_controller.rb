class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @signup = Signup.new
  end

  def download
    @signup = Signup.new(signup_params)
    if @signup.save
      flash.now[:notice] = 'Thank you - your guide should open in a moment and we will send you a copy via email too incase you need to view it on another device.'
      @pdf_url = Rails.application.secrets.pdf_url
      ApplicationMailer.guide(@signup.email, @pdf_url).deliver
    else
      flash.now[:error] = 'Uhoh - looks like there was a problem'
    end
    render action: :index
  end

  private

  def signup_params
    params.require(:signup).permit(:email)
  end
end
