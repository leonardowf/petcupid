class SheltersController < ApplicationController
  load_and_authorize_resource
  before_action :set_shelter, only: [:show, :edit, :update, :destroy]

  # GET /shelters
  # GET /shelters.json
  def index
    @shelters = Shelter.all
  end

  # GET /shelters/1
  # GET /shelters/1.json
  def show
    @animals = @shelter.animals
  end

  # GET /shelters/new
  def new
    @shelter = Shelter.new

    build_dependencies
  end

  # GET /shelters/1/edit
  def edit
    build_dependencies
  end

  # POST /shelters
  # POST /shelters.json
  def create
    @shelter = current_user.shelters.build(shelter_params)
    respond_with(@shelter)
  end

  # PATCH/PUT /shelters/1
  # PATCH/PUT /shelters/1.json
  def update
    @shelter.update(shelter_params)
    respond_with(@shelter)
  end

  # DELETE /shelters/1
  # DELETE /shelters/1.json
  def destroy
    @shelter.destroy
    respond_with(@shelter)
  end

  private
    def build_dependencies
      @shelter.photos.build unless @shelter.photos.any?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_shelter
      @shelter = Shelter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shelter_params
      params.require(:shelter).permit(:name, photos_attributes: [:id, :file])
    end
end
