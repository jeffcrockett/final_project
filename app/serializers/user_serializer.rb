class UserSerializer < ActiveModel::Serializer 
    attributes :username
    has_many :posts
    has_many :comments
end