class PagesController < ApplicationController
  def home
  end

  def sms
    # raise "Action sms in the UsersController is not implemented! received params #{params.to_json}"
    # Account SID and Auth Token enviornmental variables stored in application.yml
    # Initialize Twilio Client
    client = Twilio::REST::Client.new ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"]
    
    client.messages.create(
      from: "+16178550050", # Twilio number
      to: params[:phonenumber],
      body: params[:textinput]
    )
    puts "Sent message to #{params[:phonenumber]}"
  end
end
