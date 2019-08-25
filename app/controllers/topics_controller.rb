class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @micropost = Micropost.find_by(id: params[:micropost_id])

    if @topic.save
      redirect_to micropost_path(@micropost), success: '画像を追加しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @micropost = Micropost.find_by(id: params[:micropost_id])
    @topic.destroy
    redirect_to micropost_path(@micropost), success: '画像を削除しました'
  end

  private
  def topic_params
    params.require(:topic).permit(:image , :description , :micropost_id)
  end
end
