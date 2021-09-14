require 'csv'

namespace :import do
  
  task suppliers: :environment do
    columns = ['Код_поставщика',
               'Название_поставщика'
              ]
    file_name = 'suppliers.csv'
    db = 'Supplier'.constantize
    parse_csv(columns,file_name,db)
  end

  task skus: :environment do
    columns = ['SKU',
               'Код_поставщика',
               'Название_товара',
               'Доп_поле_1',
               'Доп_поле_2',
               'Доп_поле_3',
               'Доп_поле_4',
               'Доп_поле_5',
               'Цена'
              ]    
    file_name = 'sku.csv'
    db = 'Sku'.constantize
    parse_csv(columns,file_name,db)
  end  
end

def parse_csv(columns,file_name,db)
  path = File.join Rails.root, file_name
  CSV.foreach(path, col_sep: '¦') do |row|
    row_hash = Hash[columns.zip(row)]
    item = db.where([row_hash.first].to_h)
    if item.exists?
      item.update(row_hash)
    else
      item = db.create(row_hash)
    end
    # p item     
  end
end
