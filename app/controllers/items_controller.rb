class ItemsController < ApplicationController

    def index
      @items = Item.all
    end
    
    def show
      @item = Item.find(params[:id])
    end
    
    def new
      @item = Item.new
    end
    
    def create
      @item = Item.new(item_params)
      
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
      
      if @item.destroy
        flash[:success] = 'Item was successfully deleted.'
        redirect_to root_path
      else
        flash[:error] = 'Alguma coisa deu erro' 
        redirect_to items_path
      end
    end
    
    private
      def item_params
        params.require(:item).permit(:title, :description)
      end
end
