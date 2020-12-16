feature 'switching' do

  scenario 'switch turns' do
    sign_in_and_play
    expect(page).to have_content "Dave's turn"
  end

  scenario 'current turn(after the first turn)' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to_not have_content "Dave's turn"
    expect(page).to have_content "Mittens's turn"
  end

end
