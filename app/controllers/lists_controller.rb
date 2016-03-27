class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :update, :destroy]

  def index
    @lists = current_user.lists
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = List.build(list_params, current_user)

    if @list.save
      redirect_to lists_path, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def update
    if @list.update(list_params)
      redirect_to lists_path, notice: 'List was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, notice: 'List was successfully destroyed.'
  end

  private
    def set_list
      @list = current_user.lists.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name)
    end
end
