class ReservationsController < ApplicationController

  def create
    item = Item.find(params[:item_id])

    if current_user == item.user
      flash[:alert] = "このアカウントでは予約出来ません"
    else
      start_date = Date.parse(reservation_params[:start_date])
      end_date = Date.parse(reservation_params[:end_date])
      days = (end_date - start_date).to_i + 1

      @reservation = current_user.reservations.build(reservation_params)
      @reservation.item = item
      @reservation.price = item.price
      @reservation.total = item.price * days
      @reservation.save
      
      flash[:notice] = "予約が完了しました"
    end
    
    redirect_to item
  end

  def your_coordinations
    @coordinations = current_user.reservations.order(start_date: :asc)
  end

  def your_reservations
    @items = current_user.items
  end


  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date)
    end
end