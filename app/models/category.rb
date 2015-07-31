class Category < ActiveRecord::Base
  has_many :posts
  
  after_commit :expire_cache
  
  def self.cached_find(id)
    Rails.cache.fetch([name, id], expires_in: 5.minutes){ find(id)}
  end
  
  def expire_cache
    Rails.cache.delete([self.class.name, id])
  end
  
  
end
