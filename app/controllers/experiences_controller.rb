class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  # GET /experiences
  # GET /experiences.json
  def index
    @experiences = Experience.all
    if params[:search_experiences].present?
      @experiences = Experience.search_experiences(params[:search_experiences])
    end
  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
    guest = Guest.find(params[:guest_id])
    @experiences = guest.experiences.find(params[:id])
  end

  # GET /experiences/new
  def new
    guest = Guest.find(params[:guest_id])
    @experience = guest.experiences.build
  end

  # GET /experiences/1/edit
  def edit
    guest = Guest.find(params[:guest_id])
    @experience = guest.experiences.find(params[:id])
  end

  # POST /experiences
  # POST /experiences.json
  def create
    guest = Guest.find(params[:guest_id])
    @experience = guest.experiences.create(experience_params)

    respond_to do |format|
      if @experience.save
        format.html { redirect_to([@experience.guest, @experience], notice: 'Experience was successfully created.') }
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
    guest = Guest.find(params[:guest_id])
    @experience = guest.experiences.find(params[:id])
    respond_to do |format|
      if @experience.update_attributes(experience_params)
        format.html { redirect_to([@experience.guest, @experience], notice: 'Experience was successfully updated.') }
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
    guest = Guest.find(params[:guest_id])
    @experience = guest.experiences.find(params[:id])
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to(guest_experiences_url, notice: 'Experience was successfully destroyed.') }
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
      params.require(:experience).permit(:details, :guest_id)
    end
end
