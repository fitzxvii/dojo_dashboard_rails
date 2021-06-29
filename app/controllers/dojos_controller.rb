class DojosController < ApplicationController
  def index
    @dojos = Dojo.all 
  end

  def new
  end

  def get_flash_errors errors
    errors.each do |error|
      flash[:branch] = error if error[0..5] == 'Branch'
      flash[:street] = error if error[0..5] == 'Street'
      flash[:city] = error if error[0..3] == 'City'
      flash[:state] = error if error[0..4] == 'State'
    end
  end

  def create
    errors = Dojo.create(dojo_params).errors.full_messages
    if errors.length > 0
      get_flash_errors errors
      redirect_to '/dojos/new'
    else
      redirect_to '/'
    end
  end

  def show
    @dojo = Dojo.find(params[:id])
    @students = Student.where(dojo: params[:id])
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def update
    update_dojo = Dojo.update(params[:id], dojo_params)
    if update_dojo.valid?
			redirect_to "/"
		else 
      errors = update_dojo.errors.full_messages
      get_flash_errors errors
      redirect_to "/dojos/#{params[:id]}/edit"
    end
  end

  def destroy
    Dojo.find(params[:id]).destroy
    redirect_to "/"
  end

  private
    def dojo_params
        params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end
