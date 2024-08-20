class InssesController < ApplicationController
  before_action :set_inss, only: %i[ show edit update destroy ]

  # GET /insses or /insses.json
  def index
    @pagy, @insses = pagy(Inss.all)
  end

  # GET /insses/1 or /insses/1.json
  def show
  end

  # GET /insses/new
  def new
    @inss = Inss.new
  end

  # GET /insses/1/edit
  def edit
  end

  # POST /insses or /insses.json
  def create
    @inss = Inss.new(inss_params)

    respond_to do |format|
      if @inss.save
        flash.now[:notice] = "Inss was successfully created."
        format.turbo_stream
        format.html { redirect_to inss_url(@inss) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insses/1 or /insses/1.json
  def update
    respond_to do |format|
      if @inss.update(inss_params)
        flash.now[:notice] = "Inss was successfully updated."
        format.html { redirect_to inss_url(@inss) }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insses/1 or /insses/1.json
  def destroy
    @inss.destroy

    respond_to do |format|
      flash.now[:notice] = "Inss was successfully destroyed."
      format.html { redirect_to insses_url }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inss
      @inss = Inss.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inss_params
      params.require(:inss).permit(:star_date, :end_date, :lower_limit, :upper_limit, :aliquot)
    end
end
