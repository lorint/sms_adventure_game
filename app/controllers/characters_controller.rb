class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  # # GET /characters
  # # GET /characters.json
  # def index
  #   @characters = Character.all
  # end

  # GET /characters/1
  # GET /characters/1.json
  def show
    redirect_to new_characters_path if @character.nil?
  end

  # GET /characters/new
  def new
    # Figure out a base character to work from
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(character_params.to_h.merge({user: current_user}))

    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: 'Character was successfully created. ✓' }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.update(is_alive: false)
    respond_to do |format|
      format.html { redirect_to new_characters_path, notice: 'Character passed away.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = current_user.characters.order("id DESC").first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:user_id, :name, :money, :fear, :health, :age, :chutzpah, :location_id)
    end
end
