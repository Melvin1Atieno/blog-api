class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :body, presence: true
  accepts_nested_attributes_for :post, :user
end
