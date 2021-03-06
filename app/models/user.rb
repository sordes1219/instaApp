# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  account                :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_account               (account) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :follower_relationship, foreign_key: :following_id, class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationship, source: :follower

  has_many :following_relationship, foreign_key: :follower_id, class_name: 'Relationship', dependent: :destroy
  has_many :followings, through: :following_relationship, source: :following

  def prepare_profile
    profile || build_profile
  end

end
