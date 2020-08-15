require 'rubygems'

require 'google_drive'



session = GoogleDrive::Session.from_service_account_key("./db/config.json")

ws = session.spreadsheet_by_title("email_pays").worksheets[0]
x = 2
ws[1, 1] = "Ville"
ws[1, 2] = "Email"
ws.save

$:.unshift File.expand_path('./../lib', __FILE__)
require 'mairie'

list = Mairie.new.afficeur

list.each do |val|
	val.each do |val2|
		val2.each do |key, value|
		  ws[x,1] = key
		  ws[x,2] = value
		  ws.save
		  x += 1
		  
		end
	end
end