class StudentsController < ApplicationController
  def new
    @dojo = Dojo.find(params[:dojo_id])
  end

  def create
    new_student = Student.create(student_params)
    if new_student.valid?
      redirect_to "/dojos/#{params[:dojo_id]}"
    else 
      errors = new_student.errors.full_messages
      errors.each do |error|
        flash[:first_name] = error if error[0..9] == 'First name'
        flash[:last_name] = error if error[0..8] == 'Last name'
        flash[:email] = error if error[0..4] == 'Email'
      end
      redirect_to "/dojos/#{params[:dojo_id]}/students/new"
    end
  end

  def show
    @this_student = Student.find(params[:student_id])
		@dojo = Dojo.find(params[:dojo_id])
    @students = Student.where(dojo_id: params[:dojo_id]).where.not(id: params[:student_id])
    @cohort = Array.new
    @students.each do |student|
      unless student.created_at.strftime("%m/%d/%Y") != @this_student.created_at.strftime("%m/%d/%Y")
        @cohort.push(student)
      end
    end
  end

  def edit
    @this_student = Student.find(params[:student_id])
    @dojos = Dojo.all
    @dojo = Dojo.find(params[:dojo_id])
  end

  def update
    update_student = Student.update(params[:student_id], student_params)
    if update_student.valid?
			redirect_to "/dojos/#{params[:dojo_id]}"
		else 
      errors = update_student.errors.full_messages
      errors.each do |error|
        flash[:first_name] = error if error[0..9] == 'First name'
        flash[:last_name] = error if error[0..8] == 'Last name'
        flash[:email] = error if error[0..4] == 'Email'
      end
      redirect_to "/dojos/#{params[:dojo_id]}/students/#{params[:student_id]}/edit"
    end
  end

  def destroy
    @this_student = Student.find(params[:student_id]).destroy
    redirect_to "/dojos/#{params[:dojo_id]}"
  end

  private
		def student_params
			params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
		end
end
