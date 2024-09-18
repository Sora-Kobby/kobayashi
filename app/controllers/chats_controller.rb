class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    # ベースのクエリは全てのチャット
    @chats = Chat.all
    @user = User.all
    # 検索機能
    if params[:search].present?
      @chats = @chats.where("body LIKE ?", "%#{params[:search]}%")
    end

    # お酒検索
    if params[:drink].present?
      @chats = @chats.where("drink LIKE ?", "%#{params[:drink]}%")
    end

    # あて検索
    if params[:snack].present?
      @chats = @chats.where("snack LIKE ?", "%#{params[:snack]}%")
    end
    
    # タグによる絞り込み
    if params[:tag_ids].present?
      @chats = @chats.joins(:tags).where(tags: { id: params[:tag_ids] }).distinct
    end

    # 新しい順にソート
    case params[:sort]
    when 'likes'
      @chats = @chats.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC')
    when 'oldest'
      @chats = @chats.order(created_at: :asc)
    else
      @chats = @chats.order(created_at: :desc) # 新しい順
    end
  end   

  def new
    @chat = Chat.new
  end
  
  def create
    chat = Chat.new(chat_params)
    chat.user_id = current_user.id

    if chat.save
      redirect_to chats_path, notice: "投稿が保存されました"
    else
      render :new
    end
  end
  
  def show
    @chat = Chat.find(params[:id])
  end

  def edit
    @chat = Chat.find(params[:id])
  end

  def update
    chat = Chat.find(params[:id])
    if chat.update(chat_params)
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    chat = Chat.find(params[:id])
    chat.destroy
    redirect_to action: :index
  end

  

  private

  def chat_params
    params.require(:chat).permit(:name, :body, :drink, :snack, :image, tag_ids: [])
  end
end
