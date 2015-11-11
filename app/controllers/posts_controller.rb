class PostsController < ApplicationController

	# List all posts
	def index
		@posts = Post.all.order('created_at DESC')
	end

	# Form for adding a post
	def new
		@post = Post.new
	end

	# Add a post
	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	# Show a post
	def show
		@post = Post.find(params[:id])
	end

	# Form for editing a post
	def edit
		@post = Post.find(params[:id])
	end

	# Update a post
	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render 'edit'
		end
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end

end
