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
    respond_with(@shelter)
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    @animal.update(animal_params)
    respond_with(@shelter)
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal.destroy
    respond_with(@animal)
  end

  # GET /shelters/:shelter_id/animals/:animal_id/meet
  # GET /shelters/:shelter_id/animals/:animal_id/meet.json
  def meet
    # Envia pedido de que quer conhecer o animal. 
    # Isto mandaria uma proposta para o dono do shelter.

    # TODO: É preciso criar uma tabela associativa para saber quem já mandou proposta para o animal.
    # Assim evitaria mandar proposta múltiplas vezes.
    if params[:user_id]
      # friendly_user = User.find(params[:user_id])
      friendly_user = current_user
      AnimalMailer.meet_up_proposal(@animal, friendly_user).deliver
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
