require 'csv'

namespace :import do
  task suppliers: :environment do
    filename = File.join Rails.root, "suppliers.csv"
    CSV.foreach(filename, col_sep: '¦') do |row|
      id_supplier, name_supplier = row

      if supplier_update(id_supplier, name_supplier)
      else supplier = Supplier.create(
                "Код_поставщика" => id_supplier,
                "Название_поставщика" => name_supplier
                )
      end
      p supplier
    end
  end
end

def supplier_update(id_supplier, name_supplier)
  supplier = Supplier.where("Код_поставщика" => id_supplier)
  if supplier.exists?
    supplier.update("Название_поставщика" => name_supplier)
  else false
  end
end
