module LogsHelper
    def title
        'Log entry #' + @log.id.to_s + ':'
    end
    
    def format_timestamp(datetime)
        datetime.strftime("%k:%M:%S, %-d %b %Y")
    end
end