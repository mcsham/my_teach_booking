class RentsController < ApplicationController
  before_action :set_item, only: %i[destroy]
  before_action :authenticate_user!

  def index
    @rents = Rent.all

  end

  def new
    @item = Item.find(params[:item_id])
    @beg_date = Date.parse params[:beg_date] if params[:beg_date] && params[:beg_date] =~ /\d{4}-\d{2}-\d{2}/
    @end_date = Date.parse params[:end_date] if params[:end_date] && params[:end_date] =~ /\d{4}-\d{2}-\d{2}/
    @rent = current_user.rents.build(beg_date: params[:beg_date], end_date:  params[:end_date], item_id: params[:item_id])
    # todo
    # проверка дат
  end

  def create
    @rent = current_user.rents.build(rents_params)
    respond_to do |format|
      if @rent.save
        format.html { redirect_to  rents_path, notice: 'Rent was successfully created.' }
        format.json { render :show, status: :created, location: @rent }
      else
        format.html { render :new }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
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
    params.require(:rent).permit(:item_id, :beg_date, :end_date)
  end


end
