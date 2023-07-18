class SleepRecord < ApplicationRecord
  belongs_to :user

  validates :clock_in_time, presence: true
  validates :clock_out_time, presence: true
end
