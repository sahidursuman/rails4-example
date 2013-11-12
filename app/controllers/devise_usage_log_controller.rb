class DeviseUsageLogController < ApplicationController
  skip_authorization_check :only => [:close_devise_usage_report]
  
  before_filter :authenticate_user!
  before_filter do |c|
    c.send(:check_access_level, 'admin')
  end
   
  def devise_usage_report
    @num_days = params[:num_days].to_i
    @num_days |= 10
    @log_entries = DeviseUsageLog.where(query_last_days(@num_days))
    authorize! :read, @log_entries
    respond_to do |format|
      format.html { redirect_to admin_path }
      format.js
    end    
  end

  def close_devise_usage_report
    respond_to do |format|
      format.html { redirect_to admin_path }
      format.js
    end    
  end

  private
  
  def query_last_days num_days
    today = Time.now.strftime('%Y-%m-%d')
    past_date = (Date.today - (num_days-1).days).strftime('%Y-%m-%d')
    sprintf "CAST(updated_at as DATE) between '%s' and '%s'", past_date, today
  end

end
