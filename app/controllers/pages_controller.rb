class PagesController < ApplicationController
  before_filter :ensure_trailing_slash
  
  def about
  end

  def notes
  end
  
  def contacts
  end
  
end
