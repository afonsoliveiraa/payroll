class FinancialsController < ApplicationController
  before_action :set_employee
  before_action :set_financial, only: %i[ show edit update destroy ]

  # GET /financials or /financials.json
  def index
    @financials = Financial.all
  end

  # GET /financials/1 or /financials/1.json
  def show
  end

  # GET /financials/new
  def new
    @financial = Financial.new
  end

  # GET /financials/1/edit
  def edit
  end

  # POST /financials or /financials.json
  def create
    
    # Excluir os financials com base na competence_id e a reference
    existing_financials = Financial.where(competence_id: financial_params[:competence_id], reference: financial_params[:reference], employee_id: @employee)
    existing_financials.destroy_all

    # Variável para achar o bruto usado no cálculo dos eventos de %
    bruto = 0.0
    # Variável para achar a base de INSS
    base_inss = 0.0
    # Variável para achar a base de IRRF
    base_irrf = 0.0
    # Variável para achar a base de RPPS
    base_rpps = 0.0

    # Consultada para ordenar os eventos com base no tipo e id do evento antes de gravar o financial
    @employee.notes.joins(:event).order(Arel.sql("CASE WHEN events.formula = 'Valor Informado' THEN 0 WHEN events.formula = 'Vencimento Base' THEN 1 ELSE 2 END, events.formula DESC, notes.event_id ASC")).each do |note|
      
      if note.end_date.nil?
        note.end_date = Date.today + 100.years
      end

      if Date.parse(financial_params[:reference]).between?(note.start_date, note.end_date)

        value = 0.0
        if note.event.formula == "Valor Informado"
          value = note.value
          bruto += value

          base_inss += value if note.event.inss
          base_irrf += value if note.event.irrf
          base_rpps += value if note.event.rpps

        elsif note.event.formula == "Bruto"
          # Calculate based on percentage over all other events
          value = bruto * (note.value/100.0)
          bruto += value

          base_inss += value if note.event.inss
          base_irrf += value if note.event.irrf
          base_rpps += value if note.event.rpps

        elsif note.event.formula == "Vencimento Base"
          value_base = @employee.notes.find_by(event_id: 1)
          value = value_base.value * (note.value/100.0)
          bruto += value

          base_inss += value if note.event.inss
          base_irrf += value if note.event.irrf
          base_rpps += value if note.event.rpps

        end

        @financial = Financial.new(nature_id: @employee.nature.id, situation_id: @employee.situation_id, department_id: @employee.department.id, sector_id: @employee.sector.id, employee_id: @employee.id, role_id: @employee.role.id, event_id: note.event.id, value: value, competence_id: financial_params[:competence_id], reference: financial_params[:reference])
        
        respond_to do |format|
          if @financial.save
            flash.now[:notice] = "financial was successfully created."
            format.turbo_stream
            format.html { redirect_to financial_url(@financial) }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @financial.errors, status: :unprocessable_entity }
          end
        end

      end

    end

    if @employee.pension == 'INSS'
      # Buscar todas as faixas do INSS aplicáveis
      faixas = Inss.all

      # Variável para armazenar o valor calculado
      inss = 0.0
      irrf = 0.0

      faixas.each do |faixa|
        if base_inss > faixa.upper_limit
          inss += (faixa.upper_limit - faixa.lower_limit) * (faixa.aliquot/100.0)
        else
          inss += (base_inss - faixa.lower_limit) * (faixa.aliquot/100.0)
          break
        end
      end

      
      # Verifica se a base_inss ultrapassa o teto (última faixa)
      if base_inss > faixas.last.upper_limit
        # Por exemplo, você pode aplicar uma taxa fixa sobre o teto ou adotar outra política conforme necessário.
        inss += (faixas.last.upper_limit - faixas.last.lower_limit) * (faixas.last.aliquot / 100.0)
      end

      # Gravando o INSS
      if inss > 0
        @financial_inss = Financial.new(nature_id: @employee.nature.id, situation_id: @employee.situation_id, department_id: @employee.department.id, sector_id: @employee.sector.id, employee_id: @employee.id, role_id: @employee.role.id, event_id: 3, value: inss, competence_id: financial_params[:competence_id], reference: financial_params[:reference])
        @financial_inss.save
      end
    else
      rpps = base_rpps * (14.0/100)
      # Gravando o RPPS
      if rpps > 0
        @financial_rpps = Financial.new(nature_id: @employee.nature.id, situation_id: @employee.situation_id, department_id: @employee.department.id, sector_id: @employee.sector.id, employee_id: @employee.id, role_id: @employee.role.id, event_id: 4, value: rpps, competence_id: financial_params[:competence_id], reference: financial_params[:reference])
        @financial_rpps.save
      end
    end

    # Gravando IRRF
    if irrf > 0
      @financial_irrf = Financial.new(nature_id: @employee.nature.id, situation_id: @employee.situation_id, department_id: @employee.department.id, sector_id: @employee.sector.id, employee_id: @employee.id, role_id: @employee.role.id, event_id: 8, value: irrf, competence_id: financial_params[:competence_id], reference: financial_params[:reference])
      @financial_irrf.save
    end

  end
  

  # PATCH/PUT /financials/1 or /financials/1.json
  def update
    respond_to do |format|
      if @financial.update(financial_params)
        flash.now[:notice] = "Financial was successfully updated."
        format.html { redirect_to financial_url(@financial) }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @financial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financials/1 or /financials/1.json
  def destroy
    @financial.destroy

    respond_to do |format|
      flash.now[:notice] = "Financial was successfully destroyed."
      format.html { redirect_to financials_url }
      format.turbo_stream
    end
  end

  private
    def set_employee
      @employee = Employee.find(params[:employee_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_financial
      @financial = Financial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def financial_params
      params.require(:financial).permit(:nature_id, :situation_id, :department_id, :sector_id, :employee_id, :role_id, :event_id, :value, :competence_id, :reference)
    end
end
