FactoryBot.define do
  factory :task do
    title { 'Test1' }
    content { 'Test est ok' }
    deadline_on { Date.today.since(2.day) }
    priority { 'medium' }
    status { 'todo' }
  end

  factory :second_task, class: Task do
    title { 'Test2' } 
    content { 'Content2 est ok' }
    deadline_on { Date.today.since(1.day) }
    priority { 'low' }
    status { 'done' }
  end

  factory :third_task, class: Task do
    title { 'Test3' } 
    content { 'Content3 est ok' }
    deadline_on { Date.today }
    priority { 'low' }
    status { 'done' }
  end
end
