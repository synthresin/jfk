class PostsController < ApplicationController

	def index
		@posts = Post.where(:board_id => params[:board_id])
	end
	def new
		@post = Post.new
	end

	def create
		@post = Board.find(params[:board_id]).posts.build(params[:post])

		if @post.save
			redirect_to board_posts_path(@post.board_id)
		else
			render 'new'
		end
	end

	def show
		@post = Board.find(params[:board_id]).posts.find(params[:id])
	end

	def destroy
		Board.find(params[:board_id]).posts.find(params[:id]).destroy
		redirect_to board_posts_path
	end
end
