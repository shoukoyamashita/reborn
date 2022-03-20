class SampleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sample_mailer.get_comment.subject
  
  def get_comment(user)
    @user = user

    # @comment.restaurant_id
    # @comment.user_id = params[:user_id]
    mail to:      @user.email,
        subject: '投稿にコメントがつきました。'
  end
  
end
