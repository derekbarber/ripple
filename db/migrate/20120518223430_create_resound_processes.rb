class CreateResoundProcesses < ActiveRecord::Migration
  def change
    create_table :resound_processes do |t|
      t.integer :student_id
      t.boolean :schedule_assessment
      t.text :schedule_assessment_note
      t.date :schedule_assessment_due
      t.boolean :confirm_payment
      t.text :confirm_payment_note
      t.date :confirm_payment_due
      t.boolean :upload_assessment
      t.text :upload_assessment_note
      t.date :upload_assessment_due
      t.boolean :schedule_lessons
      t.text :schedule_lessons_note
      t.date :schedule_lessons_due
      t.boolean :welcome_email
      t.text :welcome_email_note
      t.date :welcome_email_due
      t.boolean :email_assessment
      t.text :email_assessment_note
      t.date :email_assessment_due
      t.boolean :next_day_followup
      t.text :next_day_followup_note
      t.date :next_day_followup_due
      t.boolean :one_month_followup
      t.text :one_month_followup_note
      t.date :one_month_followup_due
      t.boolean :four_month_followup
      t.text :four_month_followup_note
      t.date :four_month_followup_due

      t.timestamps
    end
  end
end
