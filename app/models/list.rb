class List < ApplicationRecord

    has_many :items, dependent: :destroy
    has_many :rights, dependent: :destroy
    has_many :users, through: :rights
end
