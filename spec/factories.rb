FactoryBot.define do
  factory :consortium do
    name "MyString"
    sub "MyString"
    date "MyString"
    time "MyString"
    location "MyString"
  end
  factory :article do
    title "MyString"
    body "MyText"
  end
  factory :user do
    name  'aaa'
    school 'grinnell'
    email 'aaa@grinnell.edu'
    password 'aaaaaa'
    confirmed_at Date.today
  end
end
