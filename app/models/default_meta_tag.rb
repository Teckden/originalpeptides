class DefaultMetaTag < ActiveRecord::Base
  attr_accessible :meta_description, :meta_keywords, :title, :method

  validates :meta_description, :meta_keywords, uniqueness: true

end
