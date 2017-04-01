class AdminController < ApplicationController
  http_basic_authenticate_with name: Rails.application.secrets.admin_username, password: Rails.application.secrets.admin_password

  def signups
    send_data Signup.all.to_csv, filename: "signups-#{Date.today}.csv"
  end
end
