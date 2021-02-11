# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Museum.destroy_all
Work.destroy_all
Gallery.destroy_all
Program.destroy_all

dam = Museum.create!(name: "Denver Art Museum", city: "Denver", admission_cost: 15, old_masters: "false", architect: "Gio Ponti")
met = Museum.create!(name: "The Metropolitan Museum of Art", city: "New York City", admission_cost: 0, old_masters: "true", architect: "Marcel Breuer")
aic = Museum.create!(name: "The Art Institute of Chicago", city: "Chicago", admission_cost: 25, old_masters: "true", architect: "Renzo Piano")
dam.works.create!(name: 'Still Life', artist: 'Pablo Picasso', year: 1937, on_display: "true", medium: "Oil on canvas")
dam.works.create!(name: 'Willy, Argus, and Lucky', artist: 'Deborah Butterfield', year: 1997, on_display: "true", medium: "Painted and patinated bronze")
dam.works.create!(name: 'Snow II', artist: 'Steven Gontarski', year: 1999, on_display: "false", medium: "Fiberglass and acrylic paint")
met.works.create!(name: 'America Today', artist: 'Thomas Hart Benton', year: 1931, on_display: "true", medium: "Tempera on canvas")
met.works.create!(name: 'History of Navigation', artist: 'Jean Dupas', year: 1934, on_display: "false", medium: "Glass, paint, gold, silver")
aic.works.create!(name: 'The Bedroom', artist: 'Vincent van Gogh', year: 1889, on_display: "true", medium: "Oil on canvas")
aic.works.create!(name: 'A Sunday on La Grande Jatte', artist: 'Georges Seurat', year: 1884, on_display: "true", medium: "Oil on canvas")
aic.works.create!(name: 'Nighthawks', artist: 'Edward Hopper', year: 1942, on_display: "true", medium: "Oil on canvas")


gallery1 = Gallery.create!(name: "Painting Gallery", capacity: 10, tech_support: true)
gallery2 = Gallery.create!(name: "Clay Gallery", capacity: 15, tech_support: true)
gallery3 = Gallery.create!(name: "Photgraphy Gallery", capacity: 30, tech_support: true)
gallery4 = Gallery.create!(name: "Smell Gallery", capacity: 20, tech_support: true)
gallery5 = Gallery.create!(name: "ASMR Gallery", capacity: 40, tech_support: true)
gallery6 = Gallery.create!(name: "Large Gallery", capacity: 100, tech_support: false)


program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)
program2 = gallery2.programs.create!(name: "Instagram Photos", number_of_participants: 26)
program3 = gallery2.programs.create!(name: "Clay Scultures", number_of_participants: 26)
program4 = gallery5.programs.create!(name: "Dark and Sounds", number_of_participants: 26)
program5 = gallery6.programs.create!(name: "Fundraiser Gala", number_of_participants: 90)
program6 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)
program7 = gallery3.programs.create!(name: "Painting Lillies", number_of_participants: 26)
program8 = gallery1.programs.create!(name: "Clay Sculptures", number_of_participants: 26)
