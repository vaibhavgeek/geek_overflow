class Search < ActiveRecord::Base
 before_save :default_values
  def default_values
    self.search_count ||= 0
  end
  def self.search(search)
  if search
    self.where("search_query like ?", "%#{search}%")
  else
    self.all
  end
end
end
