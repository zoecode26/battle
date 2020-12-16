feature 'end of game' do
  scenario 'user is told when game has ended' do
    sign_in_and_play
    11.times { attack }
    expect(page).to have_content('End of Battle!')
  end

  scenario 'attack button disappears when game is over' do
    sign_in_and_play
    11.times { attack }
    expect(page).not_to have_button('Attack')
  end

  scenario 'player 2 loses' do
    sign_in_and_play
    11.times { attack }
    expect(page).to have_content('Mittens lost!')
  end
end
