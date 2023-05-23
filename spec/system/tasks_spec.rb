require 'rails_helper'

RSpec.describe 'Fonction d\'affichage de liste', type: :system do
   describe 'Fonction d\'enregistrement' do
    context 'Lors de l\'enregistrement d\'une tâche' do
      before do 
        visit new_task_path
        fill_in "Titre", with: "first_task"
        fill_in "contenu", with: "proposition de sujets"
        click_button "Creer"
      end

      it 'La tâche enregistrée est affichée' do
        expect(page).to have_content "first_task"
      end
    end
  end

  describe 'Fonction d\'affichage de liste' do
    #Nous allons definir les données de test peuvant être partagées par plusieurs tests à l'aide de let !
    let!(:task1) { FactoryBot.create(:task, titre: "first_task", created_at: '2025-02-18') }
    let!(:task2) { FactoryBot.create(:task, titre: "second_task", created_at: '2025-02-17') }
    let!(:task3) { FactoryBot.create(:task, titre: "third_task", created_at: '2025-02-16') }
    #let!(:first_task) { FactoryBot.create(:task, titre: "first_task", created_at: Time.zone.now.ago(3.days)) }
    #let!(:second_task) { FactoryBot.create(:task, titre: "second_task", created_at: Time.zone.now.ago(2.days)) }
    #let!(:third_task) { FactoryBot.create(:task, titre: "third_task", created_at: Time.zone.now.ago(1.days)) }
    before do
      visit tasks_path
    end

      context 'Lors du passage à l\'écran de synthèse' do
       it 'La liste des tâches créées est affichée par ordre décroissant de date et d\'heure de création.' do
        task_list = all('body tbody tr')
        expect(task_list[0]).to have_content 'first_task'
        expect(task_list[1]).to have_content 'second_task'
        expect(task_list[2]).to have_content 'third_task'
      end
    end
      context 'Lors de la création d\'une nouvelle tâche' do
        it 'La nouvelle tâche s\'affiche en haut de la page' do
        visit new_task_path
        fill_in "Titre", with: "title"
        fill_in "contenu", with: "content"
        click_button "Creer"
        expect(page).to have_content "J'ai enregistré une tâche"
        end
      end
    end

  describe 'Fonction d\'affichage détaillé' do
    
    context 'Lors de la transition vers un écran de détails d\'une tâche' do
      let (:task) {FactoryBot.create(:task, titre: 'Test', content: 'Je suis un contenu')}
     
        it 'Le contenu de la tâche est affiché' do
          visit task_path(task)
          expect(page).to have_content "Je suis un contenu"
        end
     end
  end
end