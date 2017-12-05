FactoryBot.define do
  factory :user do
    name  'aaa'
    school 'grinnell'
    email 'aaa@grinnell.edu'
    password 'aaaaaa'
    confirmed_at Date.today
  end
end
