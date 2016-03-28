class Discussion < ActiveRecord::Base
  has_many :comments

  scope :order_by_comment_counts, -> {
    select("discussions.id, discussions.content, COUNT(c.discussion_id) AS comment_count")
    .joins("LEFT OUTER JOIN comments c ON discussions.id = c.discussion_id")
    .group(:id)
    .order("comment_count DESC")
  }
end
