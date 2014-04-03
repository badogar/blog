require 'spec_helper'

describe "Posts" do
  describe "GET /posts" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit posts_path
      page.should have_content("Posts Listing")
    end
  end

  describe "GET /posts" do
    it "displays posts" do
      Post.create!(:title => "paint fence", :text => "I am going to paint the fence today and its really a fun")
      
      # standard rspec way
      # ========================
      # get posts_path
      # response.body.should include("paint fence")
      # ========================
      # Capybara way to test the user experience, or what user sees on the page
      visit posts_path
      page.should have_content("paint fence")
    end
  end

  describe "POST /posts" do
    it "creates a post" do
      visit new_post_path
      fill_in "Title", with: "Test Blog Post"
      fill_in "Text", with: "There goes the text for blog post"
      click_button "Create Post"
      	page.should have_content("Post have been created successfully")
      page.should have_content("Test Blog Post")
      #post_via_redirect posts_path, :post => { :title => "blog post", :text => "This is the blog post to test it!" }
      #response.body.should include("blog post")
    end
  end
end
