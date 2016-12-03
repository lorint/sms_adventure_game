class ExperienceRemovalsController < ApplicationController
  before_action :set_experience_removal, only: [:show, :edit, :update, :destroy]

  # GET /experience_removals
  # GET /experience_removals.json
  def index
    @experience_removals = ExperienceRemoval.all
  end

  # GET /experience_removals/1
  # GET /experience_removals/1.json
  def show
  end

  # GET /experience_removals/new
  def new
    @experience_removal = ExperienceRemoval.new
  end

  # GET /experience_removals/1/edit
  def edit
  end

  # POST /experience_removals
  # POST /experience_removals.json
  def create
    @experience_removal = ExperienceRemoval.new(experience_removal_params)

    respond_to do |format|
      if @experience_removal.save
        format.html { redirect_to @experience_removal, notice: 'Experience removal was successfully created.' }
        format.json { render :show, status: :created, location: @experience_removal }
      else
        format.html { render :new }
        format.json { render json: @experience_removal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experience_removals/1
  # PATCH/PUT /experience_removals/1.json
  def update
    respond_to do |format|
      if @experience_removal.update(experience_removal_params)
        format.html { redirect_to @experience_removal, notice: 'Experience removal was successfully updated.' }
        format.json { render :show, status: :ok, location: @experience_removal }
      else
        format.html { render :edit }
        format.json { render json: @experience_removal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experience_removals/1
  # DELETE /experience_removals/1.json
  def destroy
    @experience_removal.destroy
    respond_to do |format|
      format.html { redirect_to experience_removals_url, notice: 'Experience removal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience_removal
      @experience_removal = ExperienceRemoval.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_removal_params
      params.require(:experience_removal).permit(:experience_id, :removed_experience_id, :likelihood)
    end
end
