# frozen_string_literal: true
module Pragma
  module Devise
    class ApplicationMailer < ActionMailer::Base
      default from: 'from@example.com'
      layout 'mailer'
    end
  end
end
