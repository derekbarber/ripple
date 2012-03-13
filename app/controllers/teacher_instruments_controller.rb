class TeacherInstrumentsController < ApplicationController
  before_filter :authorize

  # POST /teacher_instruments
  # POST /teacher_instruments.json
  def create

    @teacher_instrument = TeacherInstrument.new(params[:teacher_instrument])

    @teacher = Teacher.find(params[:teacher_instrument][:teacher_id])

    respond_to do |format|
      if @teacher_instrument.save
        format.html { redirect_to @teacher, notice: 'Instrument was successfully added.' }
        format.json { render json: @teacher, status: :created, location: @teacher }
      else
        format.html { render action: "new" }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_instruments/1
  # DELETE /teacher_instruments/1.json
  def destroy
    @teacher_instrument = TeacherInstrument.find(params[:id])
    @teacher = Teacher.find(@teacher_instrument.teacher_id)
    @teacher_instrument.destroy

    respond_to do |format|
      format.html { redirect_to @teacher, notice: 'Instrument was successfully deleted.' }
      format.json { head :no_content }
    end
  end

end
