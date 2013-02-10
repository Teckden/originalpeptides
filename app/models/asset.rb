class Asset < ActiveRecord::Base
  belongs_to :product
  attr_accessible :image

  has_attached_file :image, styles: { thumb: ["170x125", :png],
                                      large: ["800x600", :png] },
                        default_url: '/assets/images/:class/:attachment/default.jpg'

  validates_attachment :image,
                          content_type: {content_type: ['image/jpeg', 'image/png', 'image/gif']},
                          size: {less_than: 2.megabytes}
end
