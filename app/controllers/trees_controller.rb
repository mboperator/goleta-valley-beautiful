
class TreesController < ApplicationController
  # GET /trees
  # GET /trees.json
  helper_method :sort_column, :sort_direction
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  def index
    @trees = Tree.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render_for_api :public, :json => @trees, :root => :trees }
      format.csv { send_data @trees.to_csv }
    end
  end

  # GET /trees/1
  # GET /trees/1.json
  def show
    if params[:id] == 000

    else
      @tree = Tree.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @tree }
      end
    end

  end

  # GET /trees/new
  # GET /trees/new.json
  def new
    @tree = Tree.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tree }
    end
  end

  # GET /trees/1/edit
  def edit
    @tree = Tree.find(params[:id])
  end

  # POST /trees
  # POST /trees.json
  def create
    @tree = Tree.new(params[:tree])
    @tree.synclatlon(@tree.latitude, @tree.longitude)
    respond_to do |format|
      if @tree.save
        format.html { redirect_to @tree, notice: 'Tree was successfully created.' }
        format.json { render json: @tree, status: :created, location: @tree }
      else
        format.html { render action: 'new' }
        format.json { render json: @tree.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trees/1
  # PUT /trees/1.json
  def update
    @tree = Tree.find(params[:id])

    respond_to do |format|
      if @tree.update_attributes(params[:tree])
        format.html { redirect_to @tree, notice: 'Tree was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tree.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trees/1
  # DELETE /trees/1.json
  def destroy
    @tree = Tree.find(params[:id])
    @tree.destroy

    respond_to do |format|
      format.html { redirect_to trees_url }
      format.json { head :no_content }
    end
  end

  def sort_column
    Tree.column_names.include?(params[:sort]) ? params[:sort] : "common_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
