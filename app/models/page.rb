class Page < ActiveRecord::Base
  attr_accessible :custom_url, :text, :page, :title

  validates :custom_url, :title, :text, presence: true

  def self.get_custom_url(page)
    find_by_page(page.to_s).custom_url
  end
end
