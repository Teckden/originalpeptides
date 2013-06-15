class DefaultMetaTag < ActiveRecord::Base
  attr_accessible :meta_description, :meta_keywords, :title, :method

  validates :meta_description, :meta_keywords, uniqueness: true

  def self.filter_tag_description(page_identifier)
    begin
      find_by_method("#{page_identifier}").meta_description
    rescue
    end
  end

  def self.filter_tag_keywords(page_identifier)
    begin
      find_by_method("#{page_identifier}").meta_keywords
    rescue
    end
  end

end
