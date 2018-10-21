class Subforum < ApplicationRecord
    validates :name, uniqueness: true
    has_many :posts
    has_many :subscriptions
    has_many :users, through: :subscriptions
end
