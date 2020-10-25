# == Schema Information
#
# Table name: articles
#
#  id          :bigint           not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord

  validates :pictures, presence: true

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many_attached :pictures
  has_many :comments, dependent: :destroy


  def calc_elapsed_days
    now = Time.zone.now

    elapsed_days = ((now - created_at) / 3600 / 24).to_i
    elapsed_hours = ((now - created_at) / 3600).to_i
    
    if elapsed_days.positive?
      "#{elapsed_days} days ago"
    else
      "#{elapsed_hours} hours ago"
    end
  end

end
