class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    has_many :comments, -> { order('upvotes - downvotes DESC') }
    has_many :posts, -> { order('upvotes - downvotes DESC') }
    has_many :subscriptions
    has_many :subforums, through: :subscriptions
    # def ordered_comments
    #     self.comments.order('id')
    # end
end
