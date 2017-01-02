class Admin::AdminController < ApplicationController

  before_filter :authenticate_admin_user!

  def save_as_csv(filename)
    headers['Content-Disposition'] = %Q[attachment; filename=#{filename}.csv]
    headers['Content-Type'] ||= 'text/csv'
  end

  private


end
