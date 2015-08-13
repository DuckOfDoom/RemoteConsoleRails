module LogsHelper
    def title
        'Log entry #' + @log.id.to_s + ':'
    end
    
    def format_timestamp(time)
        time.strftime("%k:%M:%S, %-d %b %Y")
    end
    
    def format_short_log(log)
        simple_format log.lines.first(2).join("\n")
    end
end
