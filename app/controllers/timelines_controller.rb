class TimelinesController < ApplicationController
  before_action :set_timeline, only: %i[show edit update destroy lock unlock]
  before_action :login?, only: %i[new confirm create edit update destroy lock unlock]

  def new
    @timeline = if params[:back]
                  Timeline.new(timeline_params)
                else
                  Timeline.new
               end
  end

  def confirm
    @timeline = Timeline.new(timeline_params)
    @timeline.user_id = current_user.id
    render :new if @timeline.invalid?
  end

  def create
    @timeline = Timeline.new(timeline_params)
    @timeline.user_id = current_user.id

    if @timeline.save
      redirect_to timeline_path(@timeline.url), notice: 'タイムラインを新規作成しました'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @timeline.update(timeline_params)
      redirect_to user_path(current_user.id), notice: 'タイムラインの設定を編集しました'
    else
      render 'edit'
    end
  end

  def destroy
    @timeline.destroy
    redirect_to user_path(current_user.id), notice: 'タイムラインを削除しました'
  end

  def lock
    if @timeline.update(locked: true)
      redirect_to user_path(current_user.id), notice: 'タイムライン「' + @timeline.title + '」を編集ロックしました'
    end
  end

  def unlock
    if @timeline.update(locked: false)
      redirect_to user_path(current_user.id), notice: 'タイムライン「' + @timeline.title + '」の編集ロックを解除しました'
    end
  end

  def show
    if @timeline.locked
      render :show, layout: "locked_timeline_layout"
    else
      session[:timeline_id] = @timeline.id
      @new_message = Message.new
    end
  end

  private

  def timeline_params
    params.require(:timeline).permit(:title, :to_name, :from_name, :memo, :locked, :url)
  end

  def set_timeline
    @timeline = Timeline.find_by(url:params[:url])
  end
end
