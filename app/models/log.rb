class Log < ActiveRecord::Base
    def self.search(search_column, search_pattern)
        if search_column && search_pattern
            where(search_column + ' LIKE ?', "%#{search_pattern}%")
        else
            where(nil)
        end
    end
end
