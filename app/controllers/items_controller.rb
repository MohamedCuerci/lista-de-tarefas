class ItemsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
      if user_signed_in?   
        @items = Item.where(:user_id => current_user.id).order("created_at DESC")
      end
    end
    
    def show
      @item = Item.find(params[:id])
    end
    
    def new
      @item = current_user.items.build
    end
    
    def create
      @item = current_user.items.build(item_params)
      
      if @item.save
        flash[:success] = "Item successfully created"
        redirect_to @item
      else
        flash[:error] = "Something went wrong"
        render 'new', status: :unprocessable_entity
      end
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      
      if @item.update(item_params)
        flash[:success] = "Item was successfully updated"
        redirect_to @item
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
    end
    
    def destroy
      @item = Item.find(params[:id])
      @item.destroy
      
      redirect_to root_path, status: :see_other
    end
    
    def complete
        @item = Item.find(params[:id])
        @item.update_attribute(:completed_at, Time.now)
        redirect_to root_path
    end

    private
      def item_params
        params.require(:item).permit(:title, :description, :status)
      end
end
