class BoardsController < ApplicationController
	def index
		@boards = Board.all
	end

	def new
		@board = Board.new
	end

	def create
		@board = Board.new(params[:board])
		if @board.save
			redirect_to @board
		else
			render 'new'
		end
	end

	def show
		@board = Board.find(params[:id])
	end

	def destroy
		Board.find(params[:id]).destroy
		redirect_to boards_path
	end

	def edit
		@board = Board.find(params[:id])
	end

	def update
		# 음 파라미터를 받아서 넣고 저장.
		@board = Board.find(params[:id])
		@board.update_attributes(params[:board])
		if @board.save
			redirect_to boards_path
		else
			render 'edit'
		end
	end


end
