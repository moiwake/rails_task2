class HotelsController < ApplicationController
  before_action :move_to_signed_in, only: [:show]

  def index
    @hotels = Hotel.where(user_id: current_user.id)
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)

    if @hotel.save
      flash[:notice] = "ルームを登録しました"
      redirect_to hotel_path(@hotel)
    else
      render "new"
    end
  end

  def show
    if request.referer&.include?(confirm_bookings_path)
      @booking = Booking.new(session[:booking])
      @hotel = Hotel.find(params[:id])
      @user = User.find(@hotel.user_id)
    else
      @booking = Booking.new
      @hotel = Hotel.find(params[:id])
      @user = User.find(@hotel.user_id)
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    flash[:notice] = "ルームを削除しました"
    redirect_to hotels_path
  end


  private

  def hotel_params
    params.require(:hotel).permit(:room_name, :room_introduction, :price, :address, :user_id, :image)
  end

  def move_to_signed_in
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  '/users/sign_in'
    end
  end

end