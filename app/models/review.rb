class Review < ApplicationRecord
    belongs_to :user
    belongs_to :workout

    validates :rating, :content, presence: true
    validates :rating, numericality: { less_than_or_equal_to: 5, greater_than: 0,  only_integer: true }
    validates :workout_id, presence: true
    validates :user_id, presence: true


    scope :most_recent, -> (limit) { order("created_at desc").limit(limit) }
    scope :order_by_rating, -> { order("rating desc") }

    def self.average_rating
      if average(:rating)
            average(:rating).round(1)
      else
        "Not yet rated"
      end
    end

end