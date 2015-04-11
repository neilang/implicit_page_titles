describe "page title", type: :feature do
  it "returns the app name for the root" do
    visit "/"
    expect(page).to have_title "Dummy app"
  end
end
