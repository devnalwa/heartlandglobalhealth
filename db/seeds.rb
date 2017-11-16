# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [{:name => 'jane doe', :school => 'SamR university', :email => 'doe@sam.org', :password => 'asdf'}]
user = User.create!(users[0])

#User.create!(users[0])

interests = [{:name => 'bilogyu', :user => user},
             {:name => 'chemisatry', :user => user},
             {:name => 'comp sci', :user => user},
             {:name => 'computer sci', :user => user},
             {:name => 'computer science', :user => user},
             {:name => 'comp science', :user => user},
             {:name => 'computur sci', :user => user},
             {:name => 'science', :user => user},
            ]

interests.each do |interest|
    user.interests.append(Interest.create!(interest))
end