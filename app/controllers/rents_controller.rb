class RentsController < ApplicationController
  before_action :set_item, only: %i[destroy]
  before_action :authenticate_user!

  def index
    @rents = Rent.all
  end

  def new
    @item = Item.find(params[:item_id])
    @rent = current_user.rents.build
  end

  def create
    @rent = current_user.rents.build(rents_params)
  end

  def destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rents_params
    params.require(:item).permit(:id)
  end


end
