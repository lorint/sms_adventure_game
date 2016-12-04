class ExperiencePredecessorsController < ApplicationController
  before_action :set_experience, only: [:index, :new]
  before_action :set_experience_predecessor, only: [:edit, :update, :destroy]
  before_action :set_root_experiences, only: [:new, :edit]

  # GET /experience_predecessors
  # GET /experience_predecessors.json
  def index
    @experience_predecessors = @experience.experience_predecessors.all
  end

  # GET /experience_predecessors/new
  def new
    @experience_predecessor = @experience.experience_predecessors.new
    @selected_experiences = []
  end

  # GET /experience_predecessors/1/edit
  def edit
    @experience = @experience_predecessor.experience
    @selected_experiences = @experience_predecessor.experience_predecessor_drivers.map(&:driving_experience_id)
  end

  # POST /experience_predecessors
  # POST /experience_predecessors.json
  def create
    @experience_predecessor = ExperiencePredecessor.new(experience_predecessor_params)

    respond_to do |format|
      if @experience_predecessor.save
        format.html { redirect_to experiences_path, notice: 'Experience predecessor was successfully created. ✓' }
        format.json { render :show, status: :created, location: @experience_predecessor }
      else
        format.html { redirect_to new_experience_experience_predecessor_path(@experience) }
        format.json { render json: @experience_predecessor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experience_predecessors/1
  # PATCH/PUT /experience_predecessors/1.json
  def update
    respond_to do |format|
      if @experience_predecessor.update(experience_predecessor_params)
        format.html { redirect_to experiences_path, notice: 'Experience predecessor was successfully updated.' }
        format.json { render :show, status: :ok, location: @experience_predecessor }
      else
        format.html { redirect_to edit_experience_predecessor_path(@experience_predecessor) }
        format.json { render json: @experience_predecessor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experience_predecessors/1
  # DELETE /experience_predecessors/1.json
  def destroy
    @experience_predecessor.destroy
    respond_to do |format|
      format.html { redirect_to experiences_path, notice: 'Experience predecessor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_experience
      @experience = Experience.find(params[:experience_id])
    end

    def set_experience_predecessor
      @experience_predecessor = ExperiencePredecessor.find(params[:id])
    end

    def set_root_experiences
      @root_experiences = Experience.where(parent: nil).order(:name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_predecessor_params
      params.require(:experience_predecessor).permit(:likelihood, :experience_id, driving_experience_ids: [])
    end
end
