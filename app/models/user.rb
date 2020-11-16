class User < ActiveRecord::Base
    # validates :username, prescence: true

    # validates :username, prescence: true

    has_secure_password 
    has_many :albums
    
end
