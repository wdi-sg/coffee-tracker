class OrdersController < ApplicationController
  before_action :authenticate_user!
    def index
      @orders = Order.all.page(params[:page])
      #@orders = Order.all.order_list(params[:sort], current_user.id).page(params[:page])
    end

    def new
        @order = Order.new
        @kopis = Kopi.all
    end

    def create
        @order = Order.new(order_params)
        @order.user_id = current_user.id
        if @order.save
            redirect_to @order
        else
            render 'new'
        end
    end

    def show
        @order = Order.find(params[:id])
    end

    def edit
        @order = Order.find(params[:id])
        @kopis = Kopi.all

    end


    def update
        @order = Order.find(params[:id])

        if @order.update(order_params)
            redirect_to @order
        else
            render 'edit'
        end
    end

    def destroy
        @order = Order.find(params[:id])
        @order.destroy

        redirect_to orders_path
    end
    private
      def order_params
        params.require(:order).permit(:weight, :kopi_id,:user_id)
      end
end