class DevicesController < ApplicationController

	def index
		devices = Device.all
		render json: devices, status: 200
	end

  	def show
  		device = Device.find_by_id(params[:id])
    	render json: device, status: 200
  	end

  	def create
    	device = Device.new(params[:device])
      	if @device.save
        	render json: @device, status: :created
      	else
        	render json: @device.errors, status: :unprocessable_entity
      	end
  	end

  	def update
    	device = Device.find_by_id(params[:id])
      	if device.update_attributes(params[:device])
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
end
