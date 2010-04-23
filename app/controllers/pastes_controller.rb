require 'coderay'
class PastesController < ApplicationController
  # GET /pastes
  # GET /pastes.xml
  def index
    @pastes = Paste.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pastes }
    end
  end

  # GET /pastes/1
  # GET /pastes/1.xml
  def show
    @paste = Paste.find(params[:id])
    tokens = CodeRay.scan(@paste.body, @paste.language.to_sym)
    @line_numbers = params[:line_numbers]
    if @line_numbers
      # filter out the crap
      @line_numbers = 'table' unless @line_numbers == 'table' or
      @line_numbers == 'list' or @line_numbers == 'inline'

      @code = tokens.html(:line_numbers => @line_numbers.to_sym, :wrap => :div, :css => :class)
    else
      @code = tokens.html(:line_numbers => nil, :wrap => :div, :css => :class)
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @paste }
    end
  end

  # GET /pastes/new
  # GET /pastes/new.xml
  def new
    @paste = Paste.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @paste }
    end
  end

  # GET /pastes/1/edit
  def edit
    @paste = Paste.find(params[:id])
  end

  # POST /pastes
  # POST /pastes.xml
  def create
    @paste = Paste.new(params[:paste])
    @paste.language.downcase!

    respond_to do |format|
      if @paste.save
        flash[:notice] = 'Paste was successfully created.'
        format.html { redirect_to(@paste) }
        format.xml  { render :xml => @paste, :status => :created, :location => @paste }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @paste.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pastes/1
  # PUT /pastes/1.xml
  def update
    @paste = Paste.find(params[:id])

    respond_to do |format|
      if @paste.update_attributes(params[:paste])
        flash[:notice] = 'Paste was successfully updated.'
        format.html { redirect_to(@paste) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @paste.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pastes/1
  # DELETE /pastes/1.xml
  def destroy
    @paste = Paste.find(params[:id])
    @paste.destroy

    respond_to do |format|
      format.html { redirect_to(pastes_url) }
      format.xml  { head :ok }
    end
  end
end

