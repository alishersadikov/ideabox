class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new
    @user_id = params[:format].to_i
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:success] = "The new idea has been saved!"
      redirect_to idea_path(@idea)
    else
      byebug
      render :new
    end
  end


  private

  def idea_params
    params.require(:idea).permit(:content, :category_id, :user_id)
  end
end
