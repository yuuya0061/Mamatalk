class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

 validate :cannot_follow_yourself

  def cannot_follow_yourself
    if follower_id == followed_id
      errors.add(:followed_id, "自分自身をフォローできません")if follower_id == followed_id
    end
  end

end
