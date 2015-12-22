class ShowcasesController < ApplicationController
  before_filter :ensure_trailing_slash, only: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_showcase, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  # GET /showcases
  # GET /showcases.json
  def index
    @showcases = Showcase.all.page params[:page]
  end

  # GET /showcases/1
  # GET /showcases/1.json
  def show
  end

  # GET /showcases/new
  def new
    @showcase = Showcase.new
  end

  # GET /showcases/1/edit
  def edit
  end

  # POST /showcases
  # POST /showcases.json
  def create
    @showcase = Showcase.new(showcase_params)
    @showcase.user_id = current_user.id
    respond_to do |format|
      if @showcase.save
        format.html { redirect_to @showcase, notice: 'Showcase was successfully created.' }
        format.json { render :show, status: :created, location: @showcase }
      else
        format.html { render :new }
        format.json { render json: @showcase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /showcases/1
  # PATCH/PUT /showcases/1.json
  def update
    respond_to do |format|
      if @showcase.update(showcase_params)
        format.html { redirect_to @showcase, notice: 'Showcase was successfully updated.' }
        format.json { render :show, status: :ok, location: @showcase }
      else
        format.html { render :edit }
        format.json { render json: @showcase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /showcases/1
  # DELETE /showcases/1.json
  def destroy
    @showcase.destroy
    respond_to do |format|
      format.html { redirect_to showcases_url, notice: 'Showcase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_showcase
      @showcase = Showcase.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def showcase_params
      params.require(:showcase).permit(:name, :header_img_url, :album_url, :description)
    end
end
