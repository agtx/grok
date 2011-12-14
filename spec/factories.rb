
Factory.find_definitions

Factory.define :user do |user|
  user.email                       'gilad@example.com'
  user.password                    'foobar'
  user.password_confirmation       'foobar'
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end
