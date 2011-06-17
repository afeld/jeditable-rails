class GadgetsController < ApplicationController
  # GET /gadgets
  # GET /gadgets.xml
  def index
    @gadgets = Gadget.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gadgets }
    end
  end

  # GET /gadgets/1
  # GET /gadgets/1.xml
  def show
    @gadget = Gadget.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gadget }
    end
  end

  # GET /gadgets/new
  # GET /gadgets/new.xml
  def new
    @gadget = Gadget.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gadget }
    end
  end

  # GET /gadgets/1/edit
  def edit
    @gadget = Gadget.find(params[:id])
  end

  # POST /gadgets
  # POST /gadgets.xml
  def create
    @gadget = Gadget.new(params[:gadget])

    respond_to do |format|
      if @gadget.save
        format.html { redirect_to(@gadget, :notice => 'Gadget was successfully created.') }
        format.xml  { render :xml => @gadget, :status => :created, :location => @gadget }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gadget.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gadgets/1
  # PUT /gadgets/1.xml
  def update
    @gadget = Gadget.find(params[:id])

    respond_to do |format|
      if @gadget.update_attributes(params[:gadget])
        format.html { redirect_to(@gadget, :notice => 'Gadget was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gadget.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gadgets/1
  # DELETE /gadgets/1.xml
  def destroy
    @gadget = Gadget.find(params[:id])
    @gadget.destroy

    respond_to do |format|
      format.html { redirect_to(gadgets_url) }
      format.xml  { head :ok }
    end
  end
end
