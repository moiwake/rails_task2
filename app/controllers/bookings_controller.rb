class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def confirm
    @booking = Booking.new(booking_params)
    session[:booking] = @booking

    @hotel = Hotel.find(@booking.hotel_id)

    if @booking.invalid?
      # flash[:alert] = "空欄があります。"
      # @booking.errors.full_messages.each do |message|
      #   @message = message
      # end
      render template: "hotels/show"
    else
      @stay_days = (@booking.end_date.to_date - @booking.start_date.to_date).to_i
      @sum_price = @hotel.price * @booking.person_num
    end
  end

  def complete
    @booking = Booking.new(session[:booking])

    if @booking.save
      session.delete(:booking)
      redirect_to booking_path(@booking.id)
    else
      render "new"
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @hotel = Hotel.find(@booking.hotel_id)
    @sum_price = @hotel.price * @booking.person_num
    flash[:notice] = "ご予約ありがとうございます。 予約が完了しました。"
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = "予約をキャンセルしました"
    redirect_to bookings_path
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :person_num, :user_id, :hotel_id)
  end

end
