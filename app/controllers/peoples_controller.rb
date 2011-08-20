class PeoplesController < ApplicationController

  # GET /peoples
  # GET /peoples.xml
  def index
    @peoples = People.all
    @people = People.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @peoples }
    end
  end

  # GET /peoples/1
  # GET /peoples/1.xml
  def show
    @people = People.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @people }
    end
  end

  # GET /peoples/new
  # GET /peoples/new.xml
  def new
    @people = People.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @people }
    end
  end

  # GET /peoples/1/edit
  def edit
    @people = People.find(params[:id])
  end

  # POST /peoples
  # POST /peoples.xml
  def create
    @people = People.new(params[:people])
    respond_to do |format|
      if @people.save
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @people.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /peoples/1
  # PUT /peoples/1.xml
  def update
    @people = People.find(params[:id])
    respond_to do |format|
      if @people.update_attributes(params[:people])
        format.html { redirect_to(@people) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @people.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /peoples/1
  # DELETE /peoples/1.xml
  def destroy
    @people = People.find(params[:id])
    @people.destroy
    respond_to do |format|
      format.html { redirect_to(peoples_url) }
      format.xml  { head :ok }
    end
  end

end
