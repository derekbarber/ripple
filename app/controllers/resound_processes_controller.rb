class ResoundProcessesController < ApplicationController

  # GET /resound_process
  # GET /resound_process.json
  def index
    @resound_process = ResoundProcess.all
  end

  def show
    @resound_process = ResoundProcess.find(params[:id])
  end

  def new
    @resound_process = ResoundProcess.new
  end

  def create
    @resound_process = ResoundProcess.new(params[:resound_process])
    if @resound_process.save
      redirect_to @resound_process, notice: "Successfully created new process entry."
    else
      render :new
    end
  end

  def edit
    @resound_process = ResoundProcess.find(params[:id])
  end

  # PUT /resound_process/1
  # PUT /resound_process/1.json
  def update
    @resound_process = ResoundProcess.find(params[:id])


    respond_to do |format|
      if @resound_process.update_attributes(params[:resound_process])
        @schedule_assessment = ResoundProcess.where(:schedule_assessment => false)

        @confirm_payment = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => false)

        @upload_assessment = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
                                                  :upload_assessment => false)

        format.html # { redirect_to(@resound_process, :notice => 'Value was successfully updated.') }
        format.js
        format.json #{ render json: @resound_process, status: :updated }
      else
        format.html #{ render :action => "edit" }
        format.json #{ render json: @resound_process.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resound_process = ResoundProcess.find(params[:id])
    @resound_process.destroy
    redirect_to users_url, notice: "Successfully destroyed Resound Process."
  end
  
end
