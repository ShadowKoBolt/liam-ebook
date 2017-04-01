require 'open-uri'

class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.secrets.from_email
  layout 'mailer'

  def guide(email, pdf_url)
    attachments['Liam Howell Guide'] = open(pdf_url).read
    mail(to: email, subject: 'Liam Howell Guide')
  end
end
