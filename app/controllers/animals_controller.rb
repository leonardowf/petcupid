class AnimalsController < ApplicationController
  load_and_authorize_resource :shelter
  load_and_authorize_resource :animal, :through => :shelter

  before_action :set_animal, only: [:show, :edit, :update, :destroy]
  before_action :set_shelter

  # GET /animals
  # GET /animals.json
  def index
    if (@shelter.present?)
      @animals = @shelter.animals
    else
      @animals = Animal.all
    end
  end

  # GET /animals/1
  # GET /animals/1.json
  def show
  end

  # GET /animals/new
  def new
    @animal = @shelter.animals.build
  end

  # GET /animals/1/edit
  def edit
  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = @shelter.animals.build(animal_params)

    respond_to do |format|
      if @animal.save
        format.html { redirect_to @shelter, notice: 'Animal was successfully created.' }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to @shelter, notice: 'Animal was successfully updated.' }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to shelter_url(@shelter), notice: 'Animal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    def set_shelter
      if (params[:shelter_id].present?)
        @shelter = Shelter.find(params[:shelter_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_params
      params.require(:animal).permit(:id, :name, :identifier, :sex, 
              :category, :animal_description, :animal_size, :birthday, 
              :neutered, :medical_issues, :medical_issues_description, 
              :child_friendly, :dog_friendly, :cat_friendly, :litter_trained, 
              :other_info)
    end
end
