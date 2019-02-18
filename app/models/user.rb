class User < ApplicationRecord
    validates :username, :password, :full_name, presence: true
end
