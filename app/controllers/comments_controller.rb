class CommentsController < ApplicationController
  before_action :logged_in?, only: :create
  before_action :correct_user,   only: :destroy
  
  def new
  end
  
  def create 
    @comment = current_user.comments.build(comment_params)
    @comment.restaurant_id = params[:restaurant_id]
    
    if @comment.save
      flash[:success] = 'コメントしました。'
      redirect_to @comment.restaurant
    else
      flash[:danger] = 'コメントできませんでした。空欄では入力できません。'
      redirect_back(fallback_location: root_path)
    end
  end
    
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = 'コメントを削除しました。'
    redirect_to @comment.restaurant
  end


 private

  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to root_url if @comment.nil?
  end
  
end
 