class Log < ActiveRecord::Base
    def self.search(search)
        if search
            where('log LIKE ?', "%#{search}%")
        else
            scoped
        end
    end
end
