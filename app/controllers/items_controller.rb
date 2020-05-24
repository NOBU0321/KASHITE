class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorised, only: [:listing, :pricing, :description, :photo_upload, :accessories, :location, :update]

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
    @photos = @item.photos
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
    @photos = @item.photos
  end

  def accessories
  end

  def location
  end

  def update
    new_params = item_params
    new_params = item_params.merge(active: true) if is_ready_item
    if @item.update(new_params)
      flash[:notice] = "変更しました"
    else
      flash[:alert] = "変更箇所に間違いがあります"
    end
    redirect_back(fallback_location: request.referer)
  end

  def preload
    today = Date.today
    reservations = @item.reservations.where("start_date >= ? OR end_date >= ?", today, today)

    render json: reservations
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def is_authorised
      redirect_to root_path, alert: "許可されていないユーザーです" unless current_user.id == @item.user_id
    end

    def is_ready_item
      !@item.active && !@item.price.blank? && !@item.listing_name.blank? && !@item.photos.blank? && !@item.address.blank?
    end

    def item_params
      params.require(:item).permit(:item_type, :item_scene, :size, :status, :delivery, :listing_name, :summary, :address, :is_belt, :is_shoes, :is_hat, :is_watch, :price, :active)
    end
end
