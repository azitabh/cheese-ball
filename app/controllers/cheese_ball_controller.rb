class CheeseBallController < ApplicationController
  def index
    parse_sql
    unless @sqls.blank?
      matched_rows = 0
      ActiveRecord::Base.transaction do
        begin
          @sqls.each do |sql|
            match = /^[ ]*UPDATE|DELETE/i.match sql
            raise "Only Update and Delete allowed." if match.nil?
            Rails.logger.debug "Query being executed by cheese-ball: #{sql}"
            matched_rows += ActiveRecord::Base.connection.update(sql)
          end
          if matched_rows > 1000
            flash.now[:alert] = "Rows matched(#{matched_rows}) exceeded max limit(1000). Please contact admin."
          end
        rescue Exception=>e
          flash.now[:alert] = e.message
        end
        if flash.blank?
          flash.now[:alert] = "All statements executed successfully. Rows matched = #{matched_rows}"
        else
          raise ActiveRecord::Rollback
        end
      end
    end
  end

  def parse_sql
    @sqls = []
    @sqls = params["sql"].split(/;[ \r\n]*\n/) unless params["sql"].blank?
  end
end
