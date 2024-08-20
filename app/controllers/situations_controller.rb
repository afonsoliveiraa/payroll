class SituationsController < ApplicationController
  before_action :set_situation, only: %i[ show edit update destroy ]

  # GET /situations or /situations.json
  def index
   
    @pagy, @situations = pagy(Situation.all)
  end

  # GET /situations/1 or /situations/1.json
  def show
  end

  # GET /situations/new
  def new
    @situation = Situation.new
  end

  # GET /situations/1/edit
  def edit
  end

  # POST /situations or /situations.json
  def create
    @situation = Situation.new(situation_params)

    respond_to do |format|
      if @situation.save
        flash.now[:notice] = "Situation was successfully created."
        format.turbo_stream
        format.html { redirect_to situation_url(@situation) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @situation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /situations/1 or /situations/1.json
  def update
    respond_to do |format|
      if @situation.update(situation_params)
        flash.now[:notice] = "Situation was successfully updated."
        format.html { redirect_to situation_url(@situation) }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @situation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /situations/1 or /situations/1.json
  def destroy
    @situation.destroy

    respond_to do |format|
      flash.now[:notice] = "Situation was successfully destroyed."
      format.html { redirect_to situations_url }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_situation
      @situation = Situation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def situation_params
      params.require(:situation).permit(:description, :active)
    end
end
