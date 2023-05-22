require 'rails_helper'

RSpec.describe 'Task management function', type: :system do
   describe 'Registration function' do
    context 'When registering a task' do
      it 'The registered task is displayed' do
        visit new_task_path
        fill_in "Titre", with: "title"
        fill_in "Content", with: "content"
        click_button "Create Task"
        expect(page).to have_content "Task was successfully created."
      end
    end
  end

  describe 'List display function' do
      let!(:task){ FactoryBot.create(:task, title:'first_task')}
      let!(:task){ FactoryBot.create(:task, title:'second_task')}
      let!(:task){ FactoryBot.create(:task, title:'third_task')}
      before do
        visit tasks_path
      end

      context 'When transitioning to the list screen' do
       it 'The list of created tasks is displayed in descending order of creation date and time.' do
        FactoryBot.create(:task)
        visit tasks_path
        expect(page).to have_content 'Test1'
      end
    end
      context 'When creating a new task' do
        it 'New task is displayed at the top' do
        visit new_task_path
        fill_in "Titre", with: "title"
        fill_in "Content", with: "content"
        click_button "Create Task"
        expect(all('tbody tr')[0].text).to have_content Task.last.title 
        end
      end
    end

  describe 'Detailed display function' do
        
     context 'When transitioned to any task details screen' do
        it 'The content of the task is displayed' do
         
          visit task_path(task)
          all('tbody tr')[0].click_button"show-task"
            expect(page).to have_content 'Test2'
            expect(page).to have_content 'Test valide encore'
            expect(page).to have_content first_task.set_date
            expect(page).to have_button'éditer'
            expect(page).to have_button'retour'
        end
     end
  end
end