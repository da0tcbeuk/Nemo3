class DeusController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
   def index
      @deus= Deu.all
      @tweets = @deus.page(params[:page]).per(5)
      @tags = Tag.all
      @deus = @deus.where( "Title LIKE ? ",'%' + params[:search] + '%') if params[:search].present?
      #もしタグ検索したら、post_idsにタグを持ったidをまとめてそのidで検索
      if params[:tag_ids].present?
        deu_ids = []
        params[:tag_ids].each do |key, value| 
          if value == "1"
            Tag.find_by(name: key).deus.each do |p| 
              deu_ids << p.id
            end
          end
        end
        deu_ids = deu_ids.uniq
        #キーワードとタグのAND検索
        if deu_ids.present?
          @deus = @deus.where(id: deu_ids)
        else
          @deus = @deus.where(id: 0)
        end
      end
    
      
      if params[:tag]
        Tag.create(name: params[:tag])
      end
    end

  def new
     @deu = Deu.new
  end

  def create
    deu = Deu.new(deu_params)
    deu.user_id = current_user.id
    if deu.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @deu = Deu.find(params[:id])
  end
  
  def edit
    @deu = Deu.find(params[:id])
  end

  def update
    deu = Deu.find(params[:id])
    if deu.update(deu_params)
      redirect_to :action => "show", :id => deu.id
    else
      redirect_to :action => "new"
    end
  end
  
  private
  def deu_params
    params.require(:deu).permit(:Title, :Text, :Address, :image, tag_ids: [])
  end
end
