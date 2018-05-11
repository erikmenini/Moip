class Login < SitePrism::Page
    set_url 'https://conta-sandbox.moip.com.br/'

    element :user_name, :xpath, '//*[@id="login"]/main/article/section/div/form/fieldset[1]/input'
    element :password, :xpath, '//*[@id="login"]/main/article/section/div/form/fieldset[2]/input'
    element :login_button, :xpath, '//*[@id="login"]/main/article/section/div/form/button'
    element :minha_conta, :xpath, '//html/body/header/div[3]/div/div[2]/div/a/span'
    element :logout, :xpath, '//html/body/header/div[3]/div/div[2]/div/ul/li[5]/a'

    def with (user, password)
        self.user_name.set user
        self.password.set password
        self.login_button.click
    end
  end

  def logout
    find(:xpath, '//html/body/header/div[3]/div/div[2]/div/a/span').click
    find(:xpath, '//html/body/header/div[3]/div/div[2]/div/ul/li[5]/a').click
end
