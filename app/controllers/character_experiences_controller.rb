class CharacterExperiencesController < ApplicationController
  before_action :set_character_experience, only: [:show, :edit, :update, :destroy]

  # GET /character_experiences
  # GET /character_experiences.json
  def index
    @character_experiences = CharacterExperience.all
  end

  # GET /character_experiences/1
  # GET /character_experiences/1.json
  def show
  end

  # GET /character_experiences/new
  def new
    @character_experience = CharacterExperience.new
  end

  # GET /character_experiences/1/edit
  def edit
  end

  # POST /character_experiences
  # POST /character_experiences.json
  def create
    @character_experience = CharacterExperience.new(character_experience_params)

    respond_to do |format|
      if @character_experience.save
        format.html { redirect_to @character_experience, notice: 'Character experience was successfully created.' }
        format.json { render :show, status: :created, location: @character_experience }
      else
        format.html { render :new }
        format.json { render json: @character_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_experiences/1
  # PATCH/PUT /character_experiences/1.json
  def update
    respond_to do |format|
      if @character_experience.update(character_experience_params)
        format.html { redirect_to @character_experience, notice: 'Character experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_experience }
      else
        format.html { render :edit }
        format.json { render json: @character_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_experiences/1
  # DELETE /character_experiences/1.json
  def destroy
    @character_experience.destroy
    respond_to do |format|
      format.html { redirect_to character_experiences_url, notice: 'Character experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_experience
      @character_experience = CharacterExperience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_experience_params
      params.require(:character_experience).permit(:experience_id, :character_id, :instigator_id)
    end
end
