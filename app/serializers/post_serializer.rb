class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :user, :subforum, :content
  has_many :comments
end
