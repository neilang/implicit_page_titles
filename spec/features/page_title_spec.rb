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

  it "returns the route path name for index pages" do
    visit posts_path
    expect(page).to have_title "Posts"
  end

  it "uses the main record `title` for show pages" do
    post = Post.create(title: "My post")
    visit post_path(post)
    expect(page).to have_title "My post"
  end

  it "prepends new for a new record" do
    visit new_post_path
    expect(page).to have_title "New post"
  end

  it "prepends edit when editing a record" do
    post = Post.create(title: "A post")
    visit edit_post_path(post)
    expect(page).to have_title "Edit A post"
  end

  it "uses the main record `name` for show pages if there is no title attribute" do
    author = Author.create(name: "John Smith")
    visit author_path(author)
    expect(page).to have_title "John Smith"
  end
end
