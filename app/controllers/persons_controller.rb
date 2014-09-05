class PersonsController < ApplicationController
	def index
    if params[:username].present?
      persons = Person.find_by(username:params[:username]);
    else
		  persons = Person.all
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
      	if person.update_attributes(params[:person])
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
    params.require(:person).permit(:firstName, :lastName, :username, :fullName, :hasBookedDevice)
  end
end
