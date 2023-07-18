class SleepRecordsController < ApplicationController
  # API endpoint for clocking in
  def clock_in
    user = User.find(params[:user_id])
    sleep_record = user.sleep_records.create(clock_in_time: Time.current)
    render json: sleep_record, status: :created
  end

  # API endpoint for clocking out
  def clock_out
    user = User.find(params[:user_id])
    sleep_record = user.sleep_records.last
    sleep_record.update(clock_out_time: Time.current)
    render json: sleep_record, status: :ok
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

  # API endpoint for retrieving sleep records of following users from the previous week, sorted by sleep duration
  def following_sleep_records
    user = User.find(params[:user_id])
    following_users = user.following
    sleep_records = following_users.joins(:sleep_records)
                      .where("sleep_records.clock_in_time >= ?", 1.week.ago)
                      .select("sleep_records.*, sleep_records.clock_out_time - sleep_records.clock_in_time AS sleep_duration")
                      .order("sleep_duration DESC")
                      .distinct
    render json: sleep_records, status: :ok
  end
end