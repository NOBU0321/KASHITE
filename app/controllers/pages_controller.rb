class PagesController < ApplicationController
  def home
    @items = Item.where(active: true).limit(3)
  end

  def search
  end
end
