class BuildsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_build, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  # GET /builds
  # GET /builds.json
  def index
    # dry DERP
    if params[:search]
      @builds = Build.search(params[:search]).page params[:page]
    else
    case params[:t]
      when "mini"
        @builds = Build.mini.page params[:page]
      when "mid"
        @builds = Build.mid.page params[:page]      
      when "pro"
        @builds = Build.pro.page params[:page]      
      when "laptop"
        @builds = Build.laptop.page params[:page]      
      else 
        @builds = Build.all.page params[:page]
      end
    end
  end

  # GET /builds/1
  # GET /builds/1.json
  def show
  end

  # GET /builds/new
  def new
    @build = Build.new
  end

  # GET /builds/1/edit
  def edit
  end

  # POST /builds
  # POST /builds.json
  def create
    @build = Build.new(build_params)
    @build.user_id = current_user.id
    respond_to do |format|
      if @build.save
        format.html { redirect_to @build, notice: 'Build was successfully created.' }
        format.json { render :show, status: :created, location: @build }
      else
        format.html { render :new }
        format.json { render json: @build.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /builds/1
  # PATCH/PUT /builds/1.json
  def update
    respond_to do |format|
      if @build.update(build_params)
        format.html { redirect_to @build, notice: 'Build was successfully updated.' }
        format.json { render :show, status: :ok, location: @build }
      else
        format.html { render :edit }
        format.json { render json: @build.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /builds/1
  # DELETE /builds/1.json
  def destroy
    @build.destroy
    respond_to do |format|
      format.html { redirect_to builds_url, notice: 'Build was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_build
      @build = Build.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def build_params
      params.require(:build).permit(:b_type, :name, :spec, :mb, :cpu, :gpu, :ram, :disk, :chassis, :cost, :os, :im, :status, :body, :user_id)
    end
end
