class PhotosController < ApplicationController

  def create
    @item = Item.find(params[:item_id])

    if params[:images]
      params[:images].each do|img|
        @item.photos.create(image: img)
      end

      @photos = @item.photos
      redirect_back(fallback_location: request.referer, notice: "保存しました")
    end
  end

end