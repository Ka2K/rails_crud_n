class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    #1. title: ~~ == :title => ~~
    Post.create(title: params[:title], body: params[:body])
    #2. 객체조작을 통해 create
    # post = Post.new #객체에서 하나의 비어있는 인스턴스를 만들고  그 안에 값을 넣음
    # post.title = params[:title]
    # post.body = params[:body]
    # post.save
  end

  def show
    @post = Post.find(params[:id])
  end
end
