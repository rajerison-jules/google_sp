require 'json'
require "googleauth"

$:.unshift File.expand_path('./../lib', __FILE__)
require 'mairie'

list_mairie = Mairie.new.afficeur
File.open("db/email.json","w") do |f|
  f.write(list_mairie.to_json)
end 


credentials = Google::Auth::UserRefreshCredentials.new(
  client_id: "55069348320-bs9fag494cvkvfbs9f7ms8n5icg05i83.apps.googleusercontent.com",
  client_secret: "npiuU8u83VyzljcDQrV3Ev8o",
  scope: [
    "https://www.googleapis.com/auth/drive",
    "https://spreadsheets.google.com/feeds/",
  ],
  redirect_uri: "http://example.com/redirect")
auth_url = credentials.authorization_uri



File.open("db/config.json","w") do |f|
  f.write(credentials.to_json)
end 