class Link < ActiveRecord::Base
  belongs_to :user

  validates :url, :presence => true, :url => true
  validates :title, presence: true
end
