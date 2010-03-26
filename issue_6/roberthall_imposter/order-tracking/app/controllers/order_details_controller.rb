class OrderDetailsController < ApplicationController
  # GET /order_details
  # GET /order_details.xml
  def index
    @order_details = OrderDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @order_details }
    end
  end

  # GET /order_details/1
  # GET /order_details/1.xml
  def show
    @order_detail = OrderDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order_detail }
    end
  end

  # GET /order_details/new
  # GET /order_details/new.xml
  def new
    @order_detail = OrderDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order_detail }
    end
  end

  # GET /order_details/1/edit
  def edit
    @order_detail = OrderDetail.find(params[:id])
  end

  # POST /order_details
  # POST /order_details.xml
  def create
    @order_detail = OrderDetail.new(params[:order_detail])

    respond_to do |format|
      if @order_detail.save
        flash[:notice] = 'OrderDetail was successfully created.'
        format.html { redirect_to(@order_detail) }
        format.xml  { render :xml => @order_detail, :status => :created, :location => @order_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /order_details/1
  # PUT /order_details/1.xml
  def update
    @order_detail = OrderDetail.find(params[:id])

    respond_to do |format|
      if @order_detail.update_attributes(params[:order_detail])
        flash[:notice] = 'OrderDetail was successfully updated.'
        format.html { redirect_to(@order_detail) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /order_details/1
  # DELETE /order_details/1.xml
  def destroy
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.destroy

    respond_to do |format|
      format.html { redirect_to(order_details_url) }
      format.xml  { head :ok }
    end
  end
end
