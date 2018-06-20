class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    #1. title: ~~ == :title => ~~
    Post.create(title: params[:title], body: params[:body])

    flash[:notice] = "글이 작성되었습니다."

    redirect_to "/"
    # 텍스트 안에 변수를 넣을 때 (stringinterpolation) 반드시 ''가 아니라 ""로 묶어줘야 함.
    #2. 객체조작을 통해 create
    # post = Post.new #객체에서 하나의 비어있는 인스턴스를 만들고  그 안에 값을 넣음
    # post.title = params[:title]
    # post.body = params[:body]
    # post.save
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
   post = Post.find(params[:id])
   #보여주지 않을 것 이므로 @를 붙이지 않음.
   post.destroy

   flash[:alert] = "글이 삭제되었습니다."

   redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(title: params[:title], body: params[:body])

    flash[:notice] = "글이 수정되었습니다."

    redirect_to "/"
  end
end
