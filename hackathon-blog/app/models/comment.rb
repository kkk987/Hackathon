class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :comments, presence: true
  
  def self.sort_by_time(post_id)
    return Post.find(post_id).comments.order(:updated_at).reverse
  end

  def self.sort_by_user_and_time(current_user)
    return Comment.where("user_id = ?", current_user.id).order(:updated_at).reverse
  end
end
