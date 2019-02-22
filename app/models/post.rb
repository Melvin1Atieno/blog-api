class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  validates :title, :text, presence: true
end
