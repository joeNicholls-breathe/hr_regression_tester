module Settings
  def settings
     {
      staging: {
        name: 'UK Regression',
        breathe_url_login: 'https://login.breathehrstaging.com',
        breathe_url_signup: 'https://hr.breathehrstaging.com/signup',
        sign_up_email: 'admin2@regressionaccount.com',
        login_password: 'Password1',
        admin_email: 'admin@hr-regression.com',
        line_manager_email: 'line@hr-regression.com',
        employee_email: 'employee@hr-regression.com',
        setup_acc_email: 'admin@auto-reg.co.uk'
      }
    }
  end
end
