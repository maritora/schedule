class PostsController < ApplicationController
   def index
     @posts = Post.all
     @date = Date.current.strftime("現在の日時：%Y-%m-%d")
   end

   def new
     @date = Date.current.strftime("現在の日時：%Y-%m-%d")
     @post = Post.new
   end
 
   def create
     @post = Post.new(params.require(:post).permit(:title, :stday, :endday, :shujitsu, :memo))
     if @post.save
       flash[:notice] = "スケジュールを新規登録しました"
       redirect_to :posts
     else
       render "new"
     end
   end
 
   def show
     @date = Date.current.strftime("現在の日時：%Y-%m-%d")
     @post = Post.find(params[:id])
   end
 
   def edit
     @date = Date.current.strftime("現在の日時：%Y-%m-%d")
     @post = Post.find(params[:id])
   end
 
   def update
     @post = Post.find(params[:id])
     if @post.update(params.require(:post).permit(:title, :stday, :endday, :shujitsu, :memo))
       flash[:notice] = "ID「#{@post.id}」の情報を更新しました"
       redirect_to :posts
     else
       render "edit"
     end
   end
 
   def destroy
     @post = Post.find(params[:id])
     @post.destroy
     flash[:notice] = "スケジュールを削除しました"
     redirect_to :posts
   end
end