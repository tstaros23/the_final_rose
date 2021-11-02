require 'rails_helper'

RSpec.describe 'show page' do
  # User Story 1 of 6
  #
  # As a visitor,
  # When I visit '/bachelorettes/:id',
  # I see that bachelorette's:
  # -Name
  # -Season Number
  # -Description of Season that they were on
  # (e.g.
  #                   Hannah Brown
  #     Season 15 - The Most Dramatic Season Yet!
  #   )
  # I also see a link to see that bachelorette's contestants
  # When I click on that link
  # I'm taken to "/bachelorettes/:bachelorette_id/contestants"
  # and I can see only that bachelorette's contestants
  it "shows the bachelorette attributes and has a link to the bachelorette's contestants index page" do
    andrea = Bachelorette.create!(name: 'Andrea', season_number: 6, description: 'Crazy')
    contestant = Contestant.create!(name: 'Bob', age: 67, hometown: 'Denver', bachelorette_id: andrea.id)
    contestant2 = Contestant.create!(name: 'Ted', age: 28, hometown: 'SLC', bachelorette_id: andrea.id)


    tonya = Bachelorette.create!(name: 'Tonya', season_number: 7, description: 'I am pretty')
    contestant3 = Contestant.create!(name: 'George', age: 22, hometown: 'Barrington', bachelorette_id: tonya.id)


    visit "/bachelorettes/#{andrea.id}"

    expect(page).to have_content(andrea.name)
    expect(page).to have_content(andrea.season_number)
    expect(page).to have_content(andrea.description)

    expect(page).not_to have_content(tonya.name)
    expect(page).not_to have_content(tonya.season_number)
    expect(page).not_to have_content(tonya.description)

    click_on('Contestants')

    expect(current_path).to eq("/bachelorettes/#{andrea.id}/contestants")

    expect(page).to have_content(contestant.name)
    expect(page).to have_content(contestant.age)
    expect(page).to have_content(contestant.hometown)

    expect(page).to have_content(contestant2.name)
    expect(page).to have_content(contestant2.age)
    expect(page).to have_content(contestant2.hometown)

    expect(page).not_to have_content(contestant3.name)
    expect(page).not_to have_content(contestant3.age)
    expect(page).not_to have_content(contestant3.hometown)

  end
end
