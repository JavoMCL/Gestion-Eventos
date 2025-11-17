class ContractsController < ApplicationController
  before_action :set_contract, only: [:edit, :update, :destroy]
  before_action :set_form_data, only: [:new, :edit, :create, :update]

  def index
    @contracts = Contract.includes(:event).all
  end

  def new
    @contract = Contract.new
    @contract.contract_details.build
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to contracts_path, notice: 'Contrato agregado exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @contract ya está cargado por before_action
  end

  def update
    if @contract.update(contract_params)
      redirect_to contracts_path, notice: 'Contrato actualizado correctamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @contract.destroy
    redirect_to contracts_path, notice: 'Contrato eliminado exitosamente.'
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def set_form_data
    @events = Event.all
    @services = Service.where(active: true)
  end

  def contract_params
    params.require(:contract).permit(
      :contract_number,
      :event_id,
      :contract_date,
      :amount,
      :state,
      contract_details_attributes: [
        :id,
        :service_id,
        :quantity,
        :unit_price,
        :notes,
        :_destroy
      ]
    )
  end
end

