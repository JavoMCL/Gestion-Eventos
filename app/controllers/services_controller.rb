class ServicesController < ApplicationController
  before_action :set_service, only: [:edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to services_path, notice: 'Servicio agregado exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @service.update(service_params)
      redirect_to services_path, notice: 'Servicio actualizado correctamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @service.destroy
    redirect_to services_path, notice: 'Servicio eliminado exitosamente.'
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :category, :description, :base_amount, :active)
  end
end
