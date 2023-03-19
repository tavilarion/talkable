FactoryBot.define do
  factory :project do
    description { 'Test description' }
    name { 'Test project' }
    status { 0 }
  end
end
