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
        setup_acc_email_lm_user: 'lm@auto-reg.co.uk',
        setup_acc_lm_emp_email: 'lmemp@auto-reg.co.uk',
        setup_acc_email_lm_employee: 'empstd@auto-reg.co.uk',
        saas_admin_email: 'antiqueruby0@nllessons.com',
        admin_auto_approval_email: 'auto.approval@hr-regression.com',
        auto_approved_one_email: 'autoapproved.one@hr-regression.com',
        auto_approved_two_email: 'autoapproved.two@hr-regression.com',
        auto_approved_three_email: 'autoapproved.three@hr-regression.com',
        auto_approved_four_email: 'autoapproved.off@hr-regression.com',
        setup_acc_email_perms_employee: 'emp_perms@auto-reg.co.uk',
        setup_acc_email_perms_finance: 'finance@auto-reg.co.uk',
        setup_acc_email_perms_holiday: 'ha@auto-reg.co.uk',
        setup_acc_email_perms_expenses: 'expenses@auto-reg.co.uk',
        functionality_admin_user: 'admin@autofunctionality.com',
        functionality_lm_user: 'lm@autofunctionality.com',
        functionality_hr_user: 'hr@autofunctionality.com',
        functionality_employee_user: 'emp@autofunctionality.com',
        rota_admin_email: 'admin@reg-rota.co.uk',
        rota_assign_shift_to_admin_user: 'user-cell-0-roster-4-9d33e8cf-4e6f-48a8-a47c-04eef7b027c6',
        rota_employee_email: 'std.emp@reg-rota.co.uk',
        rota_line_manager_email: 'line.man@reg-rota.co.uk',
        edit_year_admin_email: 'admin@holiday-year-end.com',
        hourly_holiday_employee_email: 'hourly-employee@hr-regression.com'
      }
    }
  end
end
# rubocop:enable Metrics/MethodLength
