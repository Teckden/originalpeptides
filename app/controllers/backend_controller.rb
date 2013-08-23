class BackendController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'

  def else
    @pages = Page.all
  end



end
