class LessonController < ApplicationController
  def index
    @lesson = Lesson.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lesson }
    end
  end

  def show
    @lesson = Lesson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lesson }
    end
  end


  def new
    @lesson = Lesson.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teacher_availability }
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end


  def create
    @lesson = Lesson.new(params[:teacher_availability])

    respond_to do |format|
      if @teacher_availability.save
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render json: @lesson, status: :created, location: @lesson }
      else
        format.html { redirect_to @lesson }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @lesson = Lesson.find(params[:id])

    respond_to do |format|
      if @lesson.update_attributes(params[:teacher_availability])
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to lesson_path, notice: Lesson was successfully deleted' }
      format.json { head :no_content }
    end
  end

end
