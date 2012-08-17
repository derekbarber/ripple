class ResoundProcess < ActiveRecord::Base
  belongs_to :student

  def next_step
    if self.schedule_assessment == false
      "Schedule Assessment"
    elsif self.confirm_payment == false
      "Confirm Payment"
    elsif self.upload_assessment == false
      "Upload Assessment"
    elsif self.schedule_lessons == false
      "Schedule Lessons"
    elsif self.welcome_email == false
      "Welcome Email"
    elsif self.email_assessment == false
      "Email Assessment"
    elsif self.next_day_followup == false
      "Next Day Followup"
    elsif self.one_month_followup == false
      "One Month Followup"
    elsif self.four_month_followup == false
      "Four Month Followup"
    end
  end
end
