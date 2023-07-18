class User < ApplicationRecord
    has_many :sleep_records
  
    has_many :follower_relationships, foreign_key: :followed_id, class_name: 'Friendship'
    has_many :followers, through: :follower_relationships, source: :follower
  
    has_many :followed_relationships, foreign_key: :follower_id, class_name: 'Friendship'
    has_many :followed_users, through: :followed_relationships, source: :followed
  
    def following
      followed_users
    end
  end
  