Rails.application.routes.draw do
  post 'users/:user_id/clock_in', to: 'sleep_records#clock_in'
  get 'users/:user_id/clocked_in_times', to: 'sleep_records#clocked_in_times'
  post 'users/:user_id/follow/:friend_id', to: 'sleep_records#follow_user'
  delete 'users/:user_id/unfollow/:friend_id', to: 'sleep_records#unfollow_user'
end
