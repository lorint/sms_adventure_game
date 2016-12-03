class CharacterBasesController < ApplicationController
  before_action :set_character_basis, only: [:show, :edit, :update, :destroy]

  # GET /character_bases
  # GET /character_bases.json
  def index
    @character_bases = CharacterBase.all
  end

  # GET /character_bases/1
  # GET /character_bases/1.json
  def show
  end

  # GET /character_bases/new
  def new
    @character_basis = CharacterBase.new
  end

  # GET /character_bases/1/edit
  def edit
  end

  # POST /character_bases
  # POST /character_bases.json
  def create
    @character_basis = CharacterBase.new(character_basis_params)

    respond_to do |format|
      if @character_basis.save
        format.html { redirect_to @character_basis, notice: 'Character base was successfully created.' }
        format.json { render :show, status: :created, location: @character_basis }
      else
        format.html { render :new }
        format.json { render json: @character_basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_bases/1
  # PATCH/PUT /character_bases/1.json
  def update
    respond_to do |format|
      if @character_basis.update(character_basis_params)
        format.html { redirect_to @character_basis, notice: 'Character base was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_basis }
      else
        format.html { render :edit }
        format.json { render json: @character_basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_bases/1
  # DELETE /character_bases/1.json
  def destroy
    @character_basis.destroy
    respond_to do |format|
      format.html { redirect_to character_bases_url, notice: 'Character base was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_basis
      @character_basis = CharacterBase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_basis_params
      params.require(:character_basis).permit(:nickname, :description, :gender, :starting_money, :starting_fear, :starting_health, :starting_age, :starting_chutzpah)
    end
end
