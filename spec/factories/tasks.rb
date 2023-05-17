FactoryBot.define do
  factory :task do
    titre { 'Test1' }
    content { 'Test est ok' }
  end

  factory :second_task, class: Task do
    titre { 'Test2' } 
    content { 'Content2 est ok' }
  end
end
