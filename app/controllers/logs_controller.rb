class LogsController < ApplicationController
    helper_method :sort_column, :sort_direction

    wrap_parameters format: [:json]

    def index
        @logs = Log.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(per_page: 200, page: params[:page])
    end

    def create
        log = Log.new
        log.build_id = params[:build_id]
        log.device_id = params[:device_id]
        log.log_type = params[:log_type]
        log.log = params[:log]
        log.stack_trace = params[:stack_trace]
        log.timestamp = Time.zone.at(params[:timestamp])
        log.save
        render nothing:true
    end

    def show
        @log = Log.find(params[:id])
    end

    private
    def sort_column
        Log.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
        %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
    end
end
