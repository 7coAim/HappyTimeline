class MessagesController < ApplicationController
  before_action :set_message, only: %i[show edit update destroy]
  before_action :login?, only: %i[edit destroy]

  def create
    @message = Message.new(message_params)
    @message.timeline_id = current_timeline.id

    if @message.save
      flash[:success] = 'メッセージを投稿しました'
      redirect_to timeline_path(current_timeline.url)
    else
      flash[:danger] = 'メッセージを投稿できませんでした'
      redirect_to timeline_path(current_timeline.url)
    end
  end

  def edit; end

  def update
    if @message.update(message_params)
      redirect_to timeline_path(current_timeline.url), notice: 'メッセージを編集しました'
    else
      render 'edit'
    end
  end

  def destroy
    @message.destroy
    redirect_to timeline_path(current_timeline.url), notice: 'メッセージを削除しました'
  end

  def show; end

  private

  def message_params
    params.require(:message).permit(:post_name, :post_text)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
