class PicsController < ApplicationController
  helper_method :pic
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_pic, only: [:show, :destroy, :edit, :delete, :update, :upvote, :downvote]
  
  def index; end

  def new; end
  
  def show; end
  
  def edit; end

  def create
    if pic.save
      redirect_to pics_path,notice: "Pic created successfully"
    else
      render 'new'
    end
  end

  def update
    if pic.update(pic_params)
      redirect_to pic_path(pic), notice: "Update Pic"
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to pics_path, notice: "Pic destroyed" if pic.destroy
  end
  
  def upvote
    pic.upvote_by current_user
    redirect_to pic_path(pic)
  end

  def downvote
    pic.downvote_by current_user
    redirect_to pic_path(pic)
  end


  private

  def pic_params
    params.require(:pic).permit(:title,:description,:image,:remove_image)
  end

  def set_pic
    @pic = Pic.find(params[:id])
  end

  def pic
    @pic ||=
    case action_name
    when "index"
     Pic.user_pics
    when "new"
      Pic.new
    when "create"
      current_user.pics.build(pic_params)
    else
      set_pic rescue nil
    end
  end
end
