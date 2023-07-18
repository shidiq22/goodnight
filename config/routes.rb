Rails.application.routes.draw do
  post 'users/:user_id/clock_in', to: 'sleep_records#clock_in'
  put 'users/:user_id/clock_out', to: 'sleep_records#clock_out'
  get 'users/:user_id/clocked_in_times', to: 'sleep_records#clocked_in_times'
  post 'users/:user_id/follow/:friend_id', to: 'sleep_records#follow_user'
  delete 'users/:user_id/unfollow/:friend_id', to: 'sleep_records#unfollow_user'
  get 'users/:user_id/following_sleep_records', to: 'sleep_records#following_sleep_records'
end
