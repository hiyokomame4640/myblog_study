class PostsController < ApplicationController

#Convention over Configuration (CoC) 単数複数を固定してコーディングを減らす規約

	def index
		@posts = Post.all.order(created_at: 'desc')
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		# render plain: params[:post].inspect
		# save
		# @post = Post.new(params[:post]) 検証処理がないとエラーになる
		# @post = Post.new(params.require(:post).permit(:title, :body))
		@post = Post.new(post_params)
		if @post.save
			# redirect
			redirect_to posts_path
		else
			# render plain: @post.errors.inspect
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private
		def post_params # 検証処理
			params.require(:post).permit(:title, :body)
		end
end
