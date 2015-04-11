describe "implicit page title", type: :feature do
  it "returns the controller name for index pages" do
    visit posts_path
    expect(page).to have_title "Posts"
  end

  it "returns the main object title for show pages" do
    post = Post.create(title: "My post")
    visit post_path(post)
    expect(page).to have_title "My post"
  end
end
