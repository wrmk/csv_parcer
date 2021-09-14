namespace :import do
  
  task suppliers: :environment do
    columns = ['Код_поставщика',
               'Название_поставщика'
              ]
    file_name = 'suppliers.csv'
    db = 'Supplier'.constantize
    CsvParse.save(columns,file_name,db)
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
    CsvParse.save(columns,file_name,db)
  end  
end
