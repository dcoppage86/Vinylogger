class User < ActiveRecord::Base
    validates :email, :username, presence: true, uniqueness: true

    has_secure_password 
    has_many :albums
end
