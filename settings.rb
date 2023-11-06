# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
module Settings
  def settings
    {
      staging: {
        name: 'UK Regression',
        breathe_url_login: 'https://login.breathehrstaging.com',
        breathe_url_signup: 'https://hr.breathehrstaging.com/signup',
        login_password: 'Password1',
        admin_email: 'admin@hr-regression.com',
        line_manager_email: 'line@hr-regression.com',
        employee_email: 'employee@hr-regression.com',
        holiday_employee_email: 'holiday-employee@hr-regression.com',
        carry_over_holiday_email: 'carry.over@hr-regression.com',
        negative_carry_over_holiday_email: 'negative.carryover@hr-regression.com',
        setup_acc_email: 'admin@auto-reg.co.uk',
        setup_acc_email_hr_user: 'hr@auto-reg.co.uk',
        saas_admin_email: 'antiqueruby0@nllessons.com'
      }
    }
  end
end
# rubocop:enable Metrics/MethodLength
