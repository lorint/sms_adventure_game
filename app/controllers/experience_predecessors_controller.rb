class ExperiencePredecessorsController < ApplicationController
  before_action :set_experience_predecessor, only: [:show, :edit, :update, :destroy]

  # GET /experience_predecessors
  # GET /experience_predecessors.json
  def index
    @experience_predecessors = ExperiencePredecessor.all
  end

  # GET /experience_predecessors/1
  # GET /experience_predecessors/1.json
  def show
  end

  # GET /experience_predecessors/new
  def new
    @experience_predecessor = ExperiencePredecessor.new
  end

  # GET /experience_predecessors/1/edit
  def edit
  end

  # POST /experience_predecessors
  # POST /experience_predecessors.json
  def create
    @experience_predecessor = ExperiencePredecessor.new(experience_predecessor_params)

    respond_to do |format|
      if @experience_predecessor.save
        format.html { redirect_to @experience_predecessor, notice: 'Experience predecessor was successfully created.' }
        format.json { render :show, status: :created, location: @experience_predecessor }
      else
        format.html { render :new }
        format.json { render json: @experience_predecessor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experience_predecessors/1
  # PATCH/PUT /experience_predecessors/1.json
  def update
    respond_to do |format|
      if @experience_predecessor.update(experience_predecessor_params)
        format.html { redirect_to @experience_predecessor, notice: 'Experience predecessor was successfully updated.' }
        format.json { render :show, status: :ok, location: @experience_predecessor }
      else
        format.html { render :edit }
        format.json { render json: @experience_predecessor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experience_predecessors/1
  # DELETE /experience_predecessors/1.json
  def destroy
    @experience_predecessor.destroy
    respond_to do |format|
      format.html { redirect_to experience_predecessors_url, notice: 'Experience predecessor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience_predecessor
      @experience_predecessor = ExperiencePredecessor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_predecessor_params
      params.require(:experience_predecessor).permit(:experience_id, :previous_experience_id, :likelihood_change)
    end
end
