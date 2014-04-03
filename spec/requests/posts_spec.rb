require 'spec_helper'

describe "Posts" do
  describe "GET /posts" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get posts_path
      response.status.should be(200)
    end
  end

  describe "GET /posts" do
    it "displays posts" do
      Post.create!(:title => "paint fence", :text => "I am going to paint the fence today and its really a fun")
      get posts_path
      response.body.should include("paint fence")
    end
  end

  describe "POST /posts" do
    it "creates a post" do
      post_via_redirect posts_path, :post => { :title => "blog post", :text => "This is the blog post to test it!" }
      response.body.should include("blog post")
    end
  end
end
