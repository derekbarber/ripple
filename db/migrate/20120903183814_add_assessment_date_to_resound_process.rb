class AddAssessmentDateToResoundProcess < ActiveRecord::Migration
  def change
    add_column :resound_processes, :assessment_date, :date
  end
end
