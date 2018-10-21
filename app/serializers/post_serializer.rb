class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :user, :subforum, :content, :upvotes, :downvotes
  has_many :comments
end
