class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :memo, presence: true
end
