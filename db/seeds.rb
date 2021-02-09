# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Museum.destroy_all
Work.destroy_all
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
