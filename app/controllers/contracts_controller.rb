class ContractsController < ApplicationController
  before_action :set_contract, only: [:edit, :update, :destroy]

  def index
    @contracts = Contract.includes(:event).all
  end

  def new
    @contract = Contract.new
    @events = Event.all
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to contracts_path, notice: 'Contrato agregado exitosamente.'
    else
      @events = Event.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @events = Event.all
  end

  def update
    if @contract.update(contract_params)
      redirect_to contracts_path, notice: 'Contrato actualizado correctamente.'
    else
      @events = Event.all
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

  def contract_params
    params.require(:contract).permit(:contract_number, :event_id, :contract_date, :amount, :state)
  end
end

