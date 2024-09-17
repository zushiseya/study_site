class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  
  validates :title, presence: true
  validates :text, presence: true, length: { maximum: 500 }
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE ? OR text LIKE ?", "#{word}", "#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE ? OR text LIKE ?", "#{word}%", "#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE ? OR text LIKE ?", "%#{word}", "%#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE ? OR text LIKE ?", "%#{word}%", "%#{word}%")
    else
      @post = Post.all
    end
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
