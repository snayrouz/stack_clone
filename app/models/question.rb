class Question < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers
  has_many :taggings
  has_many :tags, through: :taggings
end
