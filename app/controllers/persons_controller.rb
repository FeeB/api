class PersonsController < ApplicationController
	def index
    if params[:fullName].present?
      persons = Person.find_by(full_name:params[:full_name]);
    else
		  persons = Person.order('last_name')
    end
		render json: persons, status: 200
	end

  	def show
  		person = Person.find_by_id(params[:id])
    	render json: person, status: 200
  	end

  	def create
    	@person = Person.create(person_params)
      	if @person.save
        	render json: @person, status: :created
      	else
        	render json: @person.errors, status: :unprocessable_entity
      	end
  	end

  	def update
    	person = Person.find_by_id(params[:id])
      	if person.update_attributes(person_params)
        	head :no_content, status: :ok 
      	else
        	render json: @person.errors, status: :unprocessable_entity 
      	end
  	end

  	def destroy
    	person = Person.find_by_id(params[:id])
      	if person.destroy
        	head :no_content, status: :ok 
      	else
        	render json: @person.errors, status: :unprocessable_entity
    	end
  	end

    def person_params
      params.permit(:first_name, :last_name, :username, :full_name, :has_booked_device)
  end
end
