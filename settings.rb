module Settings
  def settings
     {
      staging: {
        name: 'UK Regression',
        breathe_url_login: 'https://login.breathehrstaging.com',
        breathe_url_signup: 'https://hr.breathehrstaging.com/signup',
        test_sign_up_email:'admin1011@regressionaccount.com',
        test_direct_admin_email: 'admin01@regressionaccount.com',
        login_password: 'Password1'
        employee_id: '14540' #example need to add a new one when created a test account for regression suite
      }
    }
  end
end
