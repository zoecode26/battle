feature 'Enter names' do
  scenario "submitting names" do
   sign_in_and_play
   expect(page).to have_content 'Dave vs. Mittens'
  end

  scenario "check form submit button exists" do
    visit('/')
    expect(page).to have_button('Submit')
  end

  scenario "check form player 1 field exists" do
    visit('/')
    expect(page).to have_field('player_1_name')
  end

  scenario "check form player 2 field exists" do
    visit('/')
    expect(page).to have_field('player_2_name')
  end
end
