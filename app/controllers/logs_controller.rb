class LogsController < ActionController::Base
    wrap_parameters format: [:json]

    #    t.string   "device_id"
    #    t.string   "build_id"
    #    t.string   "log_type"
    #    t.string   "log"
    #    t.string   "stack_trace"
    #    t.datetime "timestamp"
    #    t.datetime "created_at"
    #    t.datetime "updated_at"

    # protect_from_forgery with: :exception

    def save_log
        puts "\n"

        log = Log.new
        log.device_id = params[:device_id]
        log.build_id = params[:build_id]
        log.log_type = params[:log_type]
        log.log = params[:log]
        log.stack_trace = params[:stack_trace]
        log.timestamp = Time.zone.at(params[:timestamp])
        log.save

        render nothing:true
    end
end
