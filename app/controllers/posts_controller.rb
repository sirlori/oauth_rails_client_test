class PostsController < ApplicationController
  before_action :authenticate_user!
  # GET /posts
  # GET /posts.json
  def index
    @posts = access_token.get("/posts/get_posts/").parsed.map{|p| Post.new(p)}
  end
end
