class DevicesController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :create

	def index
    debugger
    if params[:deviceId].present?
      devices = Device.find_by(deviceId:params[:deviceId]);
    elsif params[:deviceName].present?
      devices = Device.find_by(deviceName:params[:deviceName]);
    elsif params[:person_id].present?
      devices = Device.find_by(person_id:params[:person_id]);
    else
      devices = Device.all
    end
		render json: devices, status: 200
	end

  def show
  	device = Device.find_by_id(params[:id])
   	render json: device, status: 200
  end

  def create
   	@device = Device.create(device_params)
     	if @device.save
       	render json: @device, status: :created
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
    params.require(:device).permit(:deviceName, :category, :deviceId, :isBooked, :systemVersion, :person_id)
  end
end
