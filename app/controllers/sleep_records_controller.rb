class SleepRecordsController < ApplicationController
    # API endpoint for clocking in
  def clock_in
    user = User.find(params[:user_id])
    sleep_record = user.sleep_records.create(clock_in_time: Time.current)
    render json: sleep_record, status: :created
  end

  # API endpoint for retrieving all clocked-in times for a user
  def clocked_in_times
    user = User.find(params[:user_id])
    sleep_records = user.sleep_records.order(created_at: :asc)
    render json: sleep_records, status: :ok
  end
  
  # API endpoint for following another user
  def follow_user
    user = User.find(params[:user_id])
    friend = User.find(params[:friend_id])
    user.following << friend unless user.following.include?(friend)
    render json: { message: "Successfully followed user #{friend.id}" }, status: :ok
  end

  # API endpoint for unfollowing another user
  def unfollow_user
    user = User.find(params[:user_id])
    friend = User.find(params[:friend_id])
    user.following.delete(friend)
    render json: { message: "Successfully unfollowed user #{friend.id}" }, status: :ok
  end
end