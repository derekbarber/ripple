class StudentInstrumentsController < ApplicationController
  before_filter :authorize

  # POST /student_instruments
  # POST /student_instruments.json
  def create

    @student_instrument = StudentInstrument.new(params[:student_instrument])

    @student = Student.find(params[:student_instrument][:student_id])

    respond_to do |format|
      if @student_instrument.save
        format.html { redirect_to @student, notice: 'Instrument was successfully added.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_instruments/1
  # DELETE /teacher_instruments/1.json
  def destroy
    @student_instrument = StudentInstrument.find(params[:id])
    @student = Student.find(@student_instrument.student_id)
    @student_instrument.destroy

    respond_to do |format|
      format.html { redirect_to @student, notice: 'Instrument was successfully removed.' }
      format.json { head :no_content }
    end
  end

end
