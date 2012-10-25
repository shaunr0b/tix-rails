class Front::OrdersController < ApplicationController
  
  before_filter :set_current_order

  def create
    
  end

  def show
    
  end
  
  def new
    
  end

  def add_to_cart # POST /orders/add_to_cart/:area_id 
    area_id = params[:area_id]
    respond_to do |format|
      if @current_order.create_ticket(area_id)
        format.js { render :json => {:message => 'success', :order => @current_order} }
      else
        format.js { render :json => {:message => 'fail'}, :status => :unprocessable_entity }
      end
    end
  end

  def remove_from_cart # POST /orders/remove_from_cart/:area_id 
    area_id = params[:area_id]
    @current_order.tickets.find_by_area_id(area_id).delete
    
    respond_to do |format|
      format.html{
        redirect_to '/checkout'
      }
      format.js {
        render :json => {:message => 'success', :order => @current_order}
      }
    end
  end
  

  private
 
  
end
