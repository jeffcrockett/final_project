class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user
  belongs_to :user
  belongs_to :post
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Comment', optional: true

end
