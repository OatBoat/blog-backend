class Post < ApplicationRecord
has_many :post_tags
belongs_to :user
has_many :tags, through: :post_tags
end
