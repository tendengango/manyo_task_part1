require 'rails_helper'

RSpec.describe Task, type: :model do
  let (:user){FactoryBot.create(:user) }
  describe 'Validation test' do
    context 'If the task Title is an empty string' do
      it 'Validation fails' do
        task = Task.create(
          titre: '', 
          content: 'Create a proposal.', 
          deadline_on: '2023/5/25', 
          priority: 'low', 
          status: 'done', 
          user_id: user.id)
        expect(task).not_to be_valid
      end
    end

    context 'If the task description is empty' do
      it 'Validation fails' do
        task = Task.create(titre: 'Test1', content: '', deadline_on: '2023/5/25', priority: 'low', status: 'done', user_id: user.id)
        expect(task).not_to be_valid
        
      end
    end

    context 'If the task Title and description have values' do
      it 'You can register a task' do
        task = Task.create(
          titre: 'Titre2', 
          content: 'Create a proposal.', 
          deadline_on: '2023/5/25', 
          priority: 'low', 
          status: 'done', 
          user_id: user.id)
        expect(task).to be_valid
      end
    end
  end
  describe 'Fonction de recherche' do
    # Créez des données de test multiples.
    let!(:first_task) { FactoryBot.create(:task, titre: 'first_task_title', deadline_on: '2025/02/18', priority: 'middle', status: 'todo', user: user) }
    let!(:second_task) { FactoryBot.create(:second_task, titre: "second_task_title", deadline_on: '2025/02/17', priority: 'high', status: 'doing', user: user) }
    let!(:third_task) { FactoryBot.create(:third_task, titre: "third_task_title", deadline_on: '2025/02/16', priority: 'low', status: 'done', user: user) }
    context 'Lorsqu\'une recherche ambiguë d\'un Title la méthode scope' do
      it "Les tâches contenant des termes de recherche sont réduites." do
        # Title Exemple de code pour une méthode de recherche définie dans la portée comme search_title dans
        # Insérer des mots de recherche dans les méthodes de recherche définies à l'aide de la portée.
        # Utilisez les matrices to et not_to pour vérifier à la fois ce qui est recherché et ce qui ne l'est pas.
        # Vérifiez le nombre de données de test récupérées.
        expect(Task.search_title('first')).to include(first_task)
        expect(Task.search_title('first')).not_to include(second_task)
        expect(Task.search_title('first')).not_to include(third_task)
        expect(Task.search_title('first').count).to eq 1
      end
    end

    context 'Lorsqu\'une recherche ambiguë d\'un statut la méthode scope' do
      it "Les tâches contenant des termes de recherche sont réduites." do
        
        expect(Task.search_status('todo')).to include(first_task)
        expect(Task.search_status('todo')).not_to include(second_task)
        expect(Task.search_status('todo')).not_to include(third_task)
        expect(Task.search_status('todo').count).to eq 1
      end
    end

    context 'Lorsqu\'une recherche ambiguë d\'un statut et de titre dans la méthode scope' do
      it "Les tâches contenant des termes de recherche sont réduites." do
        
        expect(Task.search_title('first').search_status('todo')).to include(first_task)
        expect(Task.search_title('first').search_status('todo')).not_to include(second_task)
        expect(Task.search_title('first').search_status('todo')).not_to include(third_task)
        expect(Task.search_title('first').search_status('todo').count).to eq 1
      end
    end



  end
end
