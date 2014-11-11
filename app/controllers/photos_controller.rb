class PhotosController < ApplicationController
load_resource :shelter
load_resource :animal
load_and_authorize_resource :photo, :through => [:shelter, :animal]

  before_action :set_photo, only: [:show, :destroy]
  before_action :set_resource

  # GET /photos
  # GET /photos.json
  def index
    @photos = @resource.photos
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = @resource.photos.build
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = @resource.photos.build(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to [@resource, :photos], notice: 'photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def set_resource
      if (params[:animal_id].present?)
        @resource = Animal.find(params[:animal_id])
        return
      end

      if (params[:shelter_id].present?)
        @resource = Shelter.find(params[:shelter_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:file)
    end
end

