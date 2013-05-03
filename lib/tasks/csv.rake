namespace :csv do
  desc "Imports agencies from /lib/tasks/agencies.csv"
  task :importagencies => :environment do
    require 'csv'
    csv_text = File.read(File.join(Rails.root, "lib", "tasks", "agencies.csv"))
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Agency.create!(row.to_hash)
    end
  end

  desc "Imports trees from /lib/tasks/trees.csv"
  task :importtrees => :environment do
    require 'csv'
    csv_text = File.read(File.join(Rails.root, "lib", "tasks", "trees.csv"))
    #Substitute / for datefield conversion
    csv_text.tr('/', '-')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Tree.create!(row.to_hash)
    end
  end

end
