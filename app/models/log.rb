class Log < ActiveRecord::Base
    def self.search(search)
        if search
            where construct_query search
        else 
            where nil
        end
    end

    private 
    def self.construct_query(hash)
        hash.map{ |k, v| "#{k} LIKE \'%#{v}%\'"}.join(" AND ").to_s
    end
end
