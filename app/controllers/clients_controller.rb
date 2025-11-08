class ClientsController < ApplicationController
  before_action :set_client, only: [:edit, :update, :destroy]

  def index
    @clients = Client.all

    if params[:search].present?
      search_term = "%#{params[:search]}%"
      @clients = @clients.where(
        "name ILIKE ? OR email ILIKE ? OR address ILIKE ?",
        search_term, search_term, search_term
      )
    end
    @clients = @clients.page(params[:page]).per(10)
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path, notice: 'Cliente agregado exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    
  end

  def update
    if @client.update(client_params)
      redirect_to clients_path, notice: 'Cliente actualizado correctamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, notice: 'Cliente eliminado exitosamente.'
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :client_type, :phone_number, :email, :address)
  end
end
