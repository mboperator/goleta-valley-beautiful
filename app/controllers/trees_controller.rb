
class TreesController < ApplicationController
  # GET /trees
  # GET /trees.json
  helper_method :sort_column, :sort_direction
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  def index
    if params[:agency_id]
      @q = Tree.where(agency_id: params[:agency_id])
      @agency = Agency.find(params[:agency_id])
      @trees = @q.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
      @json = @q.to_gmaps4rails do |tree, marker|
        marker.infowindow render_to_string(:partial => "trees/show", :locals => { :tree => tree })
        marker.title "#{tree}"
      end
    else
      @trees = Tree.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
      @json = Tree.all(limit: 2000).to_gmaps4rails do |tree, marker|
        marker.infowindow render_to_string(:partial => "trees/show", :locals => { :tree => tree })
        marker.title "#{tree}"
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render_for_api :public, :json => @trees, :root => :trees }
      format.csv { send_data @trees.to_csv }
    end
  end

  # GET /trees/1
  # GET /trees/1.json
  def show
    @tree = Tree.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tree }

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
    @tree.synclatlon
    respond_to do |format|
      if @tree.save
        format.html { redirect_to @tree, notice: 'Tree was successfully created.' }
        format.json { render json: @tree, status: :created, location: @tree }
      else
        format.html { render 'new' }
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
        format.html { render "edit" }
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
    Tree.column_names.include?(params[:sort]) ? params[:sort] : "height"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
