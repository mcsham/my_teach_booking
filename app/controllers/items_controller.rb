# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  before_action :set_categories

  before_action :authenticate_user!, except: %i[index show]

  # GET /items
  # GET /items.json
  def index
    @items = Item.includes(:user, :category)
    @cat_param = params[:category]
    @items = @items.by_category(@cat_param) if @cat_param
    if params[:beg_date] && params[:end_date]
      @items = @items.available(params[:beg_date],params[:end_date])
    else
      @items = @items.available(Time.now, 1.day.from_now)
    end

    @items = @items.by_nickname(params[:nickname]) if params[:nickname]
    @items = @items.search(params[:q]) if params[:q] && !params[:q].empty?
    @items = @items.page(params[:item]).per(10)
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @category = @item.category
  end

  # GET /items/new
  def new
    # @item = Item.new
    @item = current_user.items.build
  end

  # GET /items/1/edit
  def edit; end

  # POST /items
  # POST /items.json
  def create
    # @item = Item.new(item_params)
    @item = current_user.items.build(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:name, :description,
                                 :category_id, :url, :user_id, :beg_date, :end_date)
  end

  def set_categories
    @categories = Category.all
  end


end
