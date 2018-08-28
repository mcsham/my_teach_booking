class RentController < ApplicationController
  before_action :set_item, only: %i[destroy]
  before_action :set_categories
  before_action :authenticate_user!

  def index
    @rents = Rent.all
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit()
  end


end
