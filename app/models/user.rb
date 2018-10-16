class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :comments, -> { order('id DESC') }
    has_many :posts
    has_many :subscriptions
    # def ordered_comments
    #     self.comments.order('id')
    # end
end
