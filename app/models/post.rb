class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :image
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  with_options presence: true do
    validates :memo
    validates :image
  end

  def self.search(search)
    if search != ''
      Post.where('memo LIKE(?)', "%#{search}%")
    else
      Post.includes(:user)
    end
  end
end
