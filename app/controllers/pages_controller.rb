class PagesController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
  end

  def search
    @results = @q.result(distinct: true)

    @count = 0
    @results.each do |result|
        @sum = @count + 1
        @count = @sum
    end
  end

  private

  def set_q
    @q = Hotel.ransack(params[:q])
  end
end
