class Employee < ApplicationRecord
        
    def self.to_csv(options = {})
        CSV.generate(options) do |csv|
          csv << column_names
            all.each do |employee|  
              csv << employee.attributes.values
            end
        end
    end
    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        employee = find_by_id(row["id"]) || new
        employee.attributes = row.to_hash
        employee.save!
        end
    end

    def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
        when ".csv" then Roo::CSV.new(file.path, packed: nil, file_warning: :ignore)
        when ".xls" then Roo::Excel.new(file.path, packed: nil, file_warning: :ignore)
        when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
        else raise "Unknown file type: #{file.original_filename}"
        end
    end
    
end
