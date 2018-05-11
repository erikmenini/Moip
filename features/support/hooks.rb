# encoding: utf-8
require 'fileutils'
Before do |feature|
    Capybara.reset_sessions!
    @base_url_client = "https://sandbox.moip.com.br/v2/customers/"
    @base_url_orders = "https://sandbox.moip.com.br/v2/orders/"
    @auth = {username: "QYB1LPVUDMUGSMMLTLFOZFV4I3PKLHIZ", password: "YFYZMEFCEC0D0NGZDECN9DRHMAIAWUWPSBL3W3UY"}
    @headers = {'Content-Type' => 'application/json'}
    @hash = "ETgV7JSgQHSFh+mdROe159GwSEQ5abhfEQqGB6cb3Mbue2QbHxCqvAE8R466ZjLg8bOTkra69ycQisiE+Lzzcba7293Qz6KguW1nrvq7/m7Psa1Zp6EOlmDDSP/b846x5A4fjK0QZG3jTPCknM7720lKpvmDaWSPrYFMYU6hNCjsXUay8SfoW7j8SAsVKmuX3uPLj9jk0aXqHzBsm3Wcw+/wi9JjdQQ4IdyYF9R6S9rw15WbCVdU1t1ztcsrLZfk14KzB393i6Yn/Sy14+hdvpjrEbb/yny95iqcg6vhfujL5XfRfMBmB1knM8cOrNAkuErNy9m0weH+VjjhFd712g=="

    @Login = Login.new
    @Client = Client.new
    @Order = Orders.new
    @Payments = Payment.new
    @SearchMoip = SearchMoip.new

end

After do |scenario|
    @Login.logout
  end