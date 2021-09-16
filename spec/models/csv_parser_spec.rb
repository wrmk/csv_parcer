require 'rails_helper'

RSpec.describe CsvParser, type: :model do
  context 'after parse' do
    db = 'Supplier'.constantize

    it 'save row if doesn`t exists' do
      row_hash = {'Код_поставщика' => '15',
                  'Название_поставщика' => 'John and sons'
      }
      
      check(row_hash,db)
    end
    it 'update row of exists' do
      row_hash = {'Код_поставщика' => '15',
                  'Название_поставщика' => 'Sons'
      }
      check(row_hash,db)
    end
  end  
end

def check(row_hash,db)
  CsvParser.save(row_hash,db)
  name = Supplier.find(row_hash['Код_поставщика']).Название_поставщика
  expect(name).to eql(row_hash['Название_поставщика'])
end

