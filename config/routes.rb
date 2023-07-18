Rails.application.routes.draw do
  post 'users/:user_id/clock_in', to: 'sleep_records#clock_in'
  get 'users/:user_id/clocked_in_times', to: 'sleep_records#clocked_in_times'
end
