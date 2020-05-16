class LandsController < ApplicationController
  before_action :set_land, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]

  def index
    @lands = current_user.lands
  end

  def new
    @land = current_user.lands.build
  end

  def create
    @land = current_user.lands.build(land_params)
    if @land.save
      redirect_to listing_land_path(@land), notice: "掲載しました"
    else
      render :new, notice: "全ての欄を記入してください"
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

  def amenities
  end

  def location
  end

  def update
    if @land.update(land_params)
      flash[:notice] = "変更しました"
    else
      flash[:notice] = "変更箇所に間違いがあります"
    end
    redirect_back(fallback_location: request.referer)
  end

  private
    def set_land
      @land = Land.find(params[:id])
    end

    def land_params
      params.require(:land).permit(:land_type, :purpose, :listing_name, :summary, :size, :address, :is_tap, :is_electronic, :is_gas, :is_parking, :price, :active)
    end
end
