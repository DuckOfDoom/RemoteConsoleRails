module LogsHelper
    def title
        'Log entry #' + @log.id.to_s + ':'
    end
    
    def format_timestamp(datetime)
        return datetime.to_s(:short)
    end
end
