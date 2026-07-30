class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true
  validates :body, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def self.search_for(content, method)
    if method == "perfect"
      where("title = ? OR body = ?", content, content)
    elsif method == "forward"
      where("title LIKE ? OR body LIKE ?", "#{content}%", "#{content}%")
    elsif method == "backward"
      where("title LIKE ? OR body LIKE ?", "#{content}%", "#{content}%")
    else
      where("title LIKE ? OR body LIKE ?", "#{content}%", "#{content}%")
    end
  end

end
