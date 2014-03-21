# encoding: UTF-8
class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  
  def index
    @people = Person.all
  end

  
  def show
  end

 
  def new
    @person = Person.new
  end

  
  def edit
  end

  
  def create
    @person = Person.new(person_params)
      if @person.name.empty? or @person.message.empty?
      	flash[:error] = 'İsim Veya Mesaj Kısmı Boş Bırakılmaz !'
      	render "new"
      else
	      if @person.save
	        redirect_to people_url
	      else
	        flash[:error] = 'Mesaj Kaydedilemedi !'
	        render "new"
	      end
	   end
    
  end

  
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  private
    def set_person
      @person = Person.find(params[:id])
    end

   
    def person_params
      params.require(:person).permit(:id, :name, :message)
    end
end
