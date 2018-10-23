class Subforum < ApplicationRecord
    validates :name, uniqueness: true
    has_many :posts, -> { order('upvotes - downvotes DESC') }
    has_many :subscriptions
    has_many :users, through: :subscriptions
end
