 require 'rails_helper'
 RSpec.describe 'Fonctions de gestion des étiquettes', type: :system do
   describe 'Fonction d\'enregistrement' do
    let!(:user) { FactoryBot.create(:user) }

    before do
      visit new_session_path
      fill_in "email address", with: user.email
      fill_in "(password)", with: "password"
      click_button "login"
    end

     context 'Lorsque les étiquettes sont enregistrées' do
       it 'Les étiquettes enregistrées sont affichées.' do
        visit new_label_path
        fill_in "Name", with: "Label56"
        click_button "Creer"
        expect(page).to have_content "Etiquette enregistrée"
       end
     end
   end
   describe 'Fonction d\'affichage de liste' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:label2) { FactoryBot.create(:label, name: "second_label", user: user) }
    let!(:label3) { FactoryBot.create(:label, name: "third_label", user: user) }

    before do
      visit new_session_path
      fill_in "email address", with: user.email
      fill_in "(password)", with: "password"
      click_button "login"
    end

     context 'Lors de la transition vers l\'écran de liste' do
       it 'Une liste des étiquettes enregistrées s\'affiche.' do
          visit labels_path
          expect(page).to have_content "second_label"
          expect(page).to have_content "third_label"
          
       end
     end
   end
 end

# require 'rails_helper'
#
#RSpec.describe 'Fonction de gestion des étiquettes', type: :system do
#  describe 'fonction d\'enregistrement' do
#    context 'Lorsque les étiquettes sont enregistrées' do
#      it 'Les étiquettes enregistrées sont affichées.' do
#        @user = FactoryBot.create(:user)
#        visit new_session_path
#        fill_in 'adresse électronique', with: @user.email
#        fill_in 'mot de passe', with: 'password'
#        click_button 'login'
#        visit new_label_path
#        fill_in 'Nom', with: 'étiquette de test'
#        click_button 'Creer'
#        expect(current_path).to eq label_path(Label.last.id)
#        expect(page).to have_content 'étiquette de test'
#      end
#    end
#  end
#  
#  describe 'fonction d\'affichage de liste' do
#    context 'Si la transition se fait vers l\'écran de synthèse' do
#      it 'La liste des étiquettes enregistrées s\'affiche.' do
#        # Créez trois étiquettes.
#        create(:label, name: 'label1')
#        create(:label, name: 'label2')
#        create(:label, name: 'label3')
#        
#        # Accéder à la page de la liste des étiquettes
#        visit labels_path
#        
#        # Vérifier que la liste des étiquettes enregistrées s'affiche.
#        expect(page).to have_content 'label1'
#        expect(page).to have_content 'label2'
#        expect(page).to have_content 'label3'
#      end
#    end
#  end
#end