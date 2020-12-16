feature 'attack' do

  scenario "attacking Player 2" do
    sign_in_and_play
    attack
    expect(page).to have_content 'Dave has attacked Mittens'
  end

  scenario "attacking Player 1" do
    sign_in_and_play
    2.times { attack }
    expect(page).to have_content 'Mittens has attacked Dave'
  end

  scenario "reduce Player 2's HP by 10" do
    sign_in_and_play
    attack
    expect(page).not_to have_content '60HP : 60HP'
    expect(page).to have_content '60HP : 50HP'
  end

  scenario "reduce Player 1's HP by 10" do
    sign_in_and_play
    2.times { attack }
    expect(page).not_to have_content '60HP : 60HP'
    expect(page).to have_content '50HP : 50HP'
  end

end
