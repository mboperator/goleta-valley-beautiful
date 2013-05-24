class TreeTypesController < ApplicationController
  def index
    @treetypes = TreeType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render_for_api :public, :json => @treetypes, :root => :treetypes }
    end
  end

  def show
    @treetype = TreeType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @treetype }
    end
  end
end