require 'open-uri'
require 'nokogiri'
require 'json'

puts 'Creating departments...'

url = "http://www.cartesfrance.fr/carte-france-departement/carte-france-departements.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

departments = []

html_doc.search('.liste_ancres_fines a').each do |element|
  text = element.text.strip
  departments << text unless text == "Départements d'outre-mer:" || text == " "
end

puts "*************************************************"
puts departments
p departments
puts "*************************************************"

departments.each do |department|
  Department.create!({
    libelle: department
  })
end
puts 'Finished!'
