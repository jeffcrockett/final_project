class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :user, :subforum
  has_many :comments
end
