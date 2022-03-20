class SampleMailer < ApplicationMailer
  
  def get_comment(user)
    @user = user
    
    @comment_user = @comment.user

    mail to:      @user.email,
        subject: '投稿にコメントがつきました。'
  end
  
end
