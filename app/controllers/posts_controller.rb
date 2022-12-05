require 'pry'

class PostsController < ApplicationController
    def index
        @user = User.new
        @posts = Post.all
        @user = User.find_by(id: current_user.id)
    end

    def new
        @post = Post.new
        @user = User.find_by(id: current_user.id)
        

    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end
    
    def update
        @post = Post.find(params[:id])
        if (@post.update(post_params))
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to posts_path
    end

    def edit
        @post = Post.find(params[:id])
 
    end


    def show
        @post = Post.find(params[:id])
        @curruser = User.find_by(id: current_user.id)
        @user = User.find_by(id: @post.user_id)
        
        
    end


    private
    def post_params
        params.require(:post).permit(:title, :content)
    end

end
