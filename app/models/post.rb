class Post < ActiveRecord::Base
  attr_accessible :content, :title, :meta_keywords, :meta_description

  validates :title, :content, presence: true
  validates :meta_description, :meta_keywords, uniqueness: true

end
