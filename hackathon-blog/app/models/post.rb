class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :title, presence: true
    validates :description, presence: true
    validates :user_id, presence: true

    def self.order_by_time
        return Post.all.order(:updated_at).reverse
    end

    def self.ordered_by_user_and_time(current_user)
        post = []
        inputs = Post.where("user_id=?", current_user.id)
        if inputs
            post += inputs.order(:updated_at).reverse
        else
          return nil
        end
        return post
      end
end
