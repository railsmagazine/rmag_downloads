class ShippersController < ApplicationController
  # GET /shippers
  # GET /shippers.xml
  def index
    @shippers = Shipper.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shippers }
    end
  end

  # GET /shippers/1
  # GET /shippers/1.xml
  def show
    @shipper = Shipper.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shipper }
    end
  end

  # GET /shippers/new
  # GET /shippers/new.xml
  def new
    @shipper = Shipper.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shipper }
    end
  end

  # GET /shippers/1/edit
  def edit
    @shipper = Shipper.find(params[:id])
  end

  # POST /shippers
  # POST /shippers.xml
  def create
    @shipper = Shipper.new(params[:shipper])

    respond_to do |format|
      if @shipper.save
        flash[:notice] = 'Shipper was successfully created.'
        format.html { redirect_to(@shipper) }
        format.xml  { render :xml => @shipper, :status => :created, :location => @shipper }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shipper.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shippers/1
  # PUT /shippers/1.xml
  def update
    @shipper = Shipper.find(params[:id])

    respond_to do |format|
      if @shipper.update_attributes(params[:shipper])
        flash[:notice] = 'Shipper was successfully updated.'
        format.html { redirect_to(@shipper) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shipper.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shippers/1
  # DELETE /shippers/1.xml
  def destroy
    @shipper = Shipper.find(params[:id])
    @shipper.destroy

    respond_to do |format|
      format.html { redirect_to(shippers_url) }
      format.xml  { head :ok }
    end
  end
end
