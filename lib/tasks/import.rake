require 'csv'

namespace :import do
  task suppliers: :environment do
    filename = File.join Rails.root, "suppliers.csv"
    CSV.foreach(filename, col_sep: '¦') do |row|
      p row
    end
  end
end