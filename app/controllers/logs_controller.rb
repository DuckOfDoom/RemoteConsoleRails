class LogsController < ApplicationController
    wrap_parameters format: [:json]
    # protect_from_forgery with: :exception

    #    t.string   "device_id"
    #    t.string   "build_id"
    #    t.string   "log_type"
    #    t.string   "log"
    #    t.string   "stack_trace"
    #    t.datetime "timestamp"
    #    t.datetime "created_at"
    #    t.datetime "updated_at"

    def index
        @logs = Log.order(sort_column + ' ' + sort_direction)

        #        @result = params.has_key?('query') ?
        #            Log.find_by_sql(params[:query]) :
        #            Log.all
    end

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

    private
    def sort_column
        params[:sort] || "created_at"
    end

    def sort_direction
        params[:direction] || "asc"
    end
end
