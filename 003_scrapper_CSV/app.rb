require 'csv'
require "googleauth"

$:.unshift File.expand_path('./../lib', __FILE__)
require 'mairie'

list_mairie = Mairie.new.afficeur
result = list_mairie.map{|tab| tab.map{|element| element.map{|k, v| [k, v]}}}
result = result.map { |data| data.join(",") }.join("\n")
File.open("./db/emails.csv", 'w') do |file|
file.write(result)
end