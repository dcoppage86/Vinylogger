class User < ActiveRecord::Base
    validates :email, :password, :username, presence: true
    validates :email, :username, uniqueness: true

    has_secure_password 
    has_many :albums
end
