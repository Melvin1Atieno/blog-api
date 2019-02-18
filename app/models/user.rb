class User < ApplicationRecord
    has_many :comments
    has_many :posts
    validates :username, :password, :full_name, presence: true
end
