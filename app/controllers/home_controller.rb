class HomeController < ApplicationController
  
  def sitemap
    respond_to do |format|
      format.xml { render file: 'public/sitemaps/sitemap.xml' }
      format.html { redirect_to root_url }
    end
  end
  
  def robots
    @posts = Post.where(published: false)
    @builds = Build.where(published: false)
  end
  
end
