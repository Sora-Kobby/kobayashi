class HelloController < ApplicationController
    def index

    
        # ChatsController の index ロジックをコピー
        @chats = Chat.all
        @user = User.all
        
        # 検索機能
        if params[:search].present?
            @chats = @chats.where("body LIKE ?", "%#{params[:search]}%")
        end
    
        if params[:drink].present?
            @chats = @chats.where("drink LIKE ?", "%#{params[:drink]}%")
        end
    
        if params[:snack].present?
            @chats = @chats.where("snack LIKE ?", "%#{params[:snack]}%")
        end
    
        if params[:tag_ids].present?
            @chats = @chats.joins(:tags).where(tags: { id: params[:tag_ids] }).distinct
        end
    
        case params[:sort]
        when 'likes'
            @chats = @chats.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC')
        when 'oldest'
            @chats = @chats.order(created_at: :asc)
        else
            @chats = @chats.order(created_at: :desc)
        end
        end
    end
    
