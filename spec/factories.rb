FactoryBot.define do

  factory :user do
    email { "joe@gmail.com" }
    password { "test123" }
    password_confirmation { "test123" }
  end

  factory :project do
    name { "project zero" }
    start_date { Time.now }
    after :create do |project|
      create_list :task, 3, project: project
    end
  end

  factory :task do
    name { "Task one" }
    deadline { 1.years.from_now }
    done { false }
  end

  factory :attachment do
    association :task, factory: :task
  end

end
