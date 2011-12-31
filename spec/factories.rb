
Factory.define :user do |user|
  user.email                       'gilad@example.com'
  user.password                    'foobar'
  user.password_confirmation       'foobar'
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :list do |list|
  list.name "temp"
  list.association :user
end


Factory.define :task do |task|
  task.description "Foo bar"
  task.association :list
end