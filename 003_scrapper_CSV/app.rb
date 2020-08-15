require 'json'
require "googleauth"

$:.unshift File.expand_path('./../lib', __FILE__)
require 'mairie'

list_mairie = Mairie.new.afficeur
File.open("db/email.json","w") do |f|
  f.write(list_mairie.to_json)
end 
