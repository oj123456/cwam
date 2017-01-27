class ApplicationMailer < ActionMailer::Base
  default from: SETTINGS[:mail][:from]
end
