class User < ApplicationRecord
    has_secure_password
    has_many :comments
    has_many :posts
    validates :username, :full_name, presence: true
    accepts_nested_attributes_for :posts, :comments
end
