class User < ApplicationRecord
    has_secure_password

    has_many :rights
    has_many :lists, through: :rights
    has_many :items, through: :lists

    validates :username, {presence: true, uniqueness: true}
end
