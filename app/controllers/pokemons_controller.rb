class PokemonsController < ApplicationController
	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer_id = current_trainer.id
		@pokemon.save
		redirect_to root_path
	end

	def damage
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health = @pokemon.health-10
		@pokemon.save
		redirect_to trainer_path(current_trainer.id)
	end

	def heal
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health = @pokemon.health+10
		@pokemon.save
		redirect_to trainer_path(current_trainer.id)
	end

	def new

	end

	def create
		@pokemon = Pokemon.new({"name"=>:name, "level"=>1, "health"=>100, "trainer_id"=>current_trainer.id})
		if @pokemon.save
			redirect_to trainer_path(current_trainer.id)
		else
			redirect_to new_path
			flash[:error] = @pokemon.errors.full_messages.to_sentence
		end
	end
end

