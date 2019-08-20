class User < ApplicationRecord
    has_many :cats

    has_secure_password
end
