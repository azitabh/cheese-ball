class CheeseBallController < ApplicationController
  def index
    parse_sql
    unless @sqls.blank?
      ActiveRecord::Base.transaction do
        @sqls.each do |sql|
          ActiveRecord::Base.connection.execute(sql)
        end
      end
    end
  end

  def parse_sql
    @sqls = []
    @sqls = params["sql"].split(";") unless params["sql"].blank?
  end
end
