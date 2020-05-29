class PagesController < ApplicationController
  def home
    @items = Item.where(active: true).limit(3)
  end

  def search
    @search = Item.ransack(params[:q])
    @items = @search.result
  end
end
