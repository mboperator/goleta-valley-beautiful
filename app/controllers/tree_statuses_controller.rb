class TreeStatusesController < ApplicationController
  # GET /tree_statuses
  # GET /tree_statuses.json
  def index
    @tree_statuses = TreeStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tree_statuses }
    end
  end

  # GET /tree_statuses/1
  # GET /tree_statuses/1.json
  def show
    @tree_status = TreeStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tree_status }
    end
  end

  # GET /tree_statuses/new
  # GET /tree_statuses/new.json
  def new
    @tree_status = TreeStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tree_status }
    end
  end

  # GET /tree_statuses/1/edit
  def edit
    @tree_status = TreeStatus.find(params[:id])
  end

  # POST /tree_statuses
  # POST /tree_statuses.json
  def create
    @tree_status = TreeStatus.new(params[:tree_status])

    respond_to do |format|
      if @tree_status.save
        format.html { redirect_to @tree_status, notice: 'Tree status was successfully created.' }
        format.json { render json: @tree_status, status: :created, location: @tree_status }
      else
        format.html { render action: "new" }
        format.json { render json: @tree_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tree_statuses/1
  # PUT /tree_statuses/1.json
  def update
    @tree_status = TreeStatus.find(params[:id])

    respond_to do |format|
      if @tree_status.update_attributes(params[:tree_status])
        format.html { redirect_to @tree_status, notice: 'Tree status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tree_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tree_statuses/1
  # DELETE /tree_statuses/1.json
  def destroy
    @tree_status = TreeStatus.find(params[:id])
    @tree_status.destroy

    respond_to do |format|
      format.html { redirect_to tree_statuses_url }
      format.json { head :no_content }
    end
  end
end
