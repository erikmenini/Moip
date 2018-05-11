class Login < SitePrism::Page
    set_url 'https://conta-sandbox.moip.com.br/'

    element :user_name, 'input[name=login]'
    element :password, 'input[name=password]'
    element :login_button, '.mg-button._full._primary' 
    element :my_account, '.fa.fa-angle-down'
    element :get_out, '.fa.fa-sign-out'
    
    def with (user, password)
        self.user_name.set user
        self.password.set password
        self.login_button.click
    end

    def logout
        self.my_account.click
        self.get_out.click
    end
end