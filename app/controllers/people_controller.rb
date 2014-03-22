# encoding: UTF-8
class PeopleController < ApplicationController
	before_action :require_login, only: [:destroy]
	def index
		@people = Person.all
	end


	def new
		@person = Person.new
	end


	def create
		@person = Person.new(person_params)
		if @person.name.empty? or @person.message.empty?
			redirect_to new_person_url
			flash[:error] = 'İsim Veya Mesaj Kısmı Boş Bırakılmaz !'
		else
			if @person.save
				redirect_to people_url
			else
				flash[:error] = 'Mesaj Kaydedilemedi !'
				render "new"
			end
		end

	end


	def destroy
		@person = Person.find(params[:id])
		if @person.present?
			@person.destroy
		end
		redirect_to people_url
	end

	private
	def set_person
		@person = Person.find(params[:id])
	end


	def person_params
		params.require(:person).permit(:id, :name, :message)
	end
end
