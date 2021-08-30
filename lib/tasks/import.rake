require 'csv'

namespace :import do
  task suppliers: :environment do
    filename = File.join Rails.root, "suppliers.csv"
    CSV.foreach(filename, col_sep: '¦') do |row|
      id_supplier, name_supplier = row

      supplier = Supplier.where("Код_поставщика" => id_supplier)
      if supplier_update(supplier, name_supplier) 
      else supplier = Supplier.create(
                "Код_поставщика" => id_supplier,
                "Название_поставщика" => name_supplier
                )
      end
      p supplier
    end
  end
end

def supplier_update(supplier, name_supplier)
  if supplier.exists?
    supplier.update("Название_поставщика" => name_supplier)
  else false
  end
end
