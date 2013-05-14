namespace :csvimport do
  desc "Imports agencies from /lib/tasks/agencies.csv"
  task :agencies => :environment do
    require 'csv'
    csv_text = File.read(File.join(Rails.root, "lib", "tasks", "agencies.csv"))
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Agency.create!(row.to_hash)
    end
  end

  desc "Imports trees from /lib/tasks/trees.csv"
  task :trees => :environment do
    require 'csv'
    csv_text = File.read(File.join(Rails.root, "lib", "tasks", "trees.csv"))
    #Substitute / for datefield conversion
    csv_text.tr('/', '-')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Tree.create!(row.to_hash)
    end
  end

  desc "Imports genuses from /lib/tasks/genus.csv"
  task :genus => :environment do
    require 'csv'
    csv_text = File.read(File.join(Rails.root, "lib", "tasks", "genus.csv"))
    #Substitute / for datefield conversion
    csv_text.tr('/', '-')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      TreeGenus.create!(row.to_hash)
    end
  end

  desc "Imports species from /lib/tasks/species.csv"
  task :species => :environment do
    require 'csv'
    csv_text = File.read(File.join(Rails.root, "lib", "tasks", "species.csv"))
    #Substitute / for datefield conversion
    csv_text.tr('/', '-')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      TreeType.create!(row.to_hash)
    end
  end

end
