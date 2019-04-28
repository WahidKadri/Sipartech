require 'open-uri'
require 'nokogiri'
require 'json'

# puts 'Creating departments...'

# url = "http://www.cartesfrance.fr/carte-france-departement/carte-france-departements.html"

# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)

# departments = []

# html_doc.search('.liste_ancres_fines a').each do |element|
#   text = element.text.strip
#   departments << text unless text == "Départements d'outre-mer:" || text == " "
# end

# puts "*************************************************"
# puts departments
# p departments
# puts "*************************************************"

# departments.each do |department|
#   Department.create!({
#     libelle: department
#   })
# end
# puts 'Finished!'


puts "Creating Haute-Savoie commune's hash..."

url = "https://public.opendatasoft.com/api/records/1.0/search/?dataset=correspondance-code-insee-code-postal&q=haute+savoie&rows=294&facet=postal_code&facet=nom_comm&facet=superficie&facet=population&facet=z_moyen&refine.nom_dept=HAUTE-SAVOIE"

haute_savoie_infos = open(url).read
parsed_json = JSON.parse(haute_savoie_infos)
records = parsed_json["records"]

communes = []
attribut = {}
records.each do |record|
  attribut = {
    postal_code: record["fields"]["postal_code"],
    commune_name: record["fields"]["nom_comm"],
    altitude_moyenne: record["fields"]["z_moyen"],
    superficie: record["fields"]["superficie"],
    population: record["fields"]["population"]
  }
  communes << attribut
end

communes.each do |commune|
  Commune.create!(commune)
end

puts 'Finished!'
