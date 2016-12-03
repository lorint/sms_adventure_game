class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:edit, :update, :destroy]

  # GET /experiences
  # GET /experiences.json
  def index
    @experiences = Experience.all
    @root_experiences = Experience.where(parent: nil).order(:name)
    selected_experience = params[:parent_id].to_i
    selected_experience = -1 if selected_experience == 0
    @experience = Experience.new(parent_id: selected_experience)
  end

  # GET /experiences/new
  def new
    @experience = Experience.new
  end

  # GET /experiences/1/edit
  def edit
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @experience = Experience.new(experience_params)

    respond_to do |format|
      if @experience.save
        format.html { redirect_to experiences_path, notice: 'Experience was successfully created.' }
        format.json { render :show, status: :created, location: @experience }
      else
        format.html { render :new }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to experiences_path, notice: 'Experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @experience }
      else
        format.html { render :edit }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: 'Experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params.require(:experience).permit(:name, :parent_id, :money_change, :health_change, :happiness_change, :got_game_change,
        :min_money, :max_money,
        :min_health, :max_health,
        :min_happiness, :max_happiness,
        :min_got_game, :max_got_game)
    end
end
