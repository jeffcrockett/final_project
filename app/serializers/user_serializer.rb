class UserSerializer < ActiveModel::Serializer 
    attributes :id, :username
    has_many :posts
    has_many :comments
    has_many :subscriptions
    has_many :subforums, through: :subscriptions
end