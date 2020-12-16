feature 'Hit point display' do
  scenario "playing" do
    sign_in_and_play
    expect(page).to have_content '60HP'
  end
end
