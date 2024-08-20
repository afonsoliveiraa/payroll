class NaturesController < ApplicationController
  before_action :set_nature, only: %i[ show edit update destroy ]

  # GET /natures or /natures.json
  def index
    @pagy, @natures = pagy(Nature.all)
  end

  # GET /natures/1 or /natures/1.json
  def show
  end

  # GET /natures/new
  def new
    @nature = Nature.new
  end

  # GET /natures/1/edit
  def edit
  end

  # POST /natures or /natures.json
  def create
    @nature = Nature.new(nature_params)

    respond_to do |format|
      if @nature.save
        flash.now[:notice] = "Nature was successfully created."
        format.turbo_stream
        format.html { redirect_to nature_url(@nature) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /natures/1 or /natures/1.json
  def update
    respond_to do |format|
      if @nature.update(nature_params)
        flash.now[:notice] = "Nature was successfully updated."
        format.html { redirect_to nature_url(@nature) }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /natures/1 or /natures/1.json
  def destroy
    @nature.destroy

    respond_to do |format|
      flash.now[:notice] = "Nature was successfully destroyed."
      format.html { redirect_to natures_url }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nature
      @nature = Nature.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nature_params
      params.require(:nature).permit(:description, :abbreviation)
    end
end
