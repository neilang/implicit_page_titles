describe "page title", type: :feature do
  it "returns the app name for the root" do
    visit root_path
    expect(page).to have_title "Dummy app"
  end

  it "will use the page title set in the view" do
    visit view_set_page_title_path
    expect(page).to have_title "Hello World!"
  end

  it "converts the route path to a page title" do
    visit another_route_path
    expect(page).to have_title "Another route"
  end

  it "returns the controller name for index pages" do
    visit posts_path
    expect(page).to have_title "Posts"
  end

  it "uses the main object title for show pages" do
    post = Post.create(title: "My post")
    visit post_path(post)
    expect(page).to have_title "My post"
  end
end
