class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :watchlists
    has_many :stocks, through: :watchlists
    has_many :comments
end
