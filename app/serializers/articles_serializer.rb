class ArticlesSerializer < ActiveModel::Serializer
  attributes :id :username
  belongs_to :profile
  has_many :post
end
