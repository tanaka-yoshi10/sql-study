class Discussion < ActiveRecord::Base
  has_many :comments

  scope :with_comment_counts, -> {
    select("discussions.id, MAX(discussions.content) AS content, COUNT(c.id) AS comment_count")
      .joins("LEFT OUTER JOIN comments c ON c.discussion_id = discussions.id")
      .group(:id)
  }
end
