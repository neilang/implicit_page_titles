describe "page title", type: :feature do
  it "returns the app name for the root" do
    visit root_path
    expect(page).to have_title "Dummy app"
  end

  it "will use a page title set in the view" do
    visit view_set_page_title_path
    expect(page).to have_title "Hello World!"
  end

  it "will use a route path" do
    visit another_route_path
    expect(page).to have_title "Another route"
  end
end
