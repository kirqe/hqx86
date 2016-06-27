class BuildsController < ApplicationController
  #before_filter :ensure_trailing_slash, only: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show, :autocomplete]
  before_action :set_build, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /builds
  # GET /builds.json

  def index
    if params[:query].present?
      @builds = Build.published.search(params[:query], page: params[:page], per_page: 15)
    else
      @builds = Build.get_builds(params[:b_type]).page params[:page]
    end
  end

  def autocomplete
    render json: Build.search(params[:query], autocomplete: false, limit: 10)#(&:title)
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
    params.require(:build).permit(:b_type, :name, :spec, :mb, :cpu, :gpu, :ram, :disk, :chassis, :cost, :os, :im, :status, :body, :other_hw, :mb_url, :cpu_url, :gpu_url, :ram_url, :disk_url, :chassis_url, :user_id, :published, :tweeted)
  end
end
