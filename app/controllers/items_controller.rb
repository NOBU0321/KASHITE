class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]

  def index
    @items = current_user.items
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to listing_item_path(@item), notice: "掲載しました"
    else
      flash[:alert] = "全ての欄を記入してください"
      render :new
    end
  end

  def show
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
  end

  def accessories
  end

  def location
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "変更しました"
    else
      flash[:alert] = "変更箇所に間違いがあります"
    end
    redirect_back(fallback_location: request.referer)
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:item_type, :item_scene, :size, :status, :delivery, :listing_name, :summary, :address, :is_belt, :is_shoes, :is_hat, :is_watch, :price, :active)
    end
end
