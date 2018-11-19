require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit games_url
  #
  #   assert_selector "h1", text: "Game"
  # end
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end

  test "submitting a random word gives a message that it's not a valid word" do
    visit new_url
    fill_in "word", with: "xyz"
    click_on "Play"

    assert_selector "p", text: "Sorry but xyz cannot be built out of"
  end

  test "submitting a one-letter word gives a message that it's not a valid word" do
    visit new_url
    fill_in "word", with: "R"
    click_on "Play"

    assert_text "R does not seem to be a valid English word"
  end

end
