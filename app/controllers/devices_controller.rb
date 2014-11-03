class DevicesController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :create

	def index
    debugger
    if params[:device_id].present?
      devices = Device.find_by(device_id:params[:device_id]);
    elsif params[:device_name].present?
      devices = Device.find_by(device_name:params[:device_name]);
    elsif params[:person_id].present?
      puts :person_id
      devices = Device.where(:person_id => params[:person_id]).order('device_name')
    else
      devices = Device.order('device_name')
    end
		render :json => devices.to_json(include: :person), status: 200
	end

  def show
    @device = Device.includes(:person).find(params[:id])
    render :json => @device.to_json(include: :person), status: 200
  end

  def create
   	@device = Device.create(device_params)
     	if @device.save
       	render :json => @device.to_json(include: :person), status: :created
     	else
       	render json: @device.errors, status: :unprocessable_entity
     	end
  end

  def update
   	@device = Device.find_by_id(params[:id])
     	if @device.update_attributes(device_params)
       	head :no_content, status: :ok 
     	else
       	render json: @device.errors, status: :unprocessable_entity 
     	end
  end

  def destroy
   	device = Device.find_by_id(params[:id])
     	if device.destroy
       	head :no_content, status: :ok 
     	else
       	render json: @device.errors, status: :unprocessable_entity
   	end
  end

  def device_params
    params.require(:device).permit(:device_name, :category, :device_id, :is_booked, :system_version, :person_id, :avatar, :image_data_encoded, :device_type)
  end
end
