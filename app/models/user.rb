class User < ApplicationRecord
    validates_presence_of :name, :password

    has_secure_password
end
