class Parser
  require 'csv'

  def self.parse(columns,file_name,db)
    path = File.join Rails.root, file_name
    CSV.foreach(path, col_sep: '¦') do |row|
      row_hash = Hash[columns.zip(row)]
      save(row_hash,db)
    end
  end

  def self.save(row_hash,db)
    item = db.where([row_hash.first].to_h)
    if item.exists?
      item.update(row_hash)
    else
      item = db.create(row_hash)
    end
    p item 
  end
end 