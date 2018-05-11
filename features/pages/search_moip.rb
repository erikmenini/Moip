class SearchMoip < SitePrism::Page

    element :pedidos_button, :xpath, '//*[@id="tour-pedidos"]'
    element :search_Field, :xpath, '//*[@id="order-search-filters"]//*[@id="q"]'
    element :search_button, :xpath, '//*[@id="order-search-filters"]/label/a[3]/span'
    element :search_header_field, :xpath, '//*[@id="q"]'
    element :search_header_button, :xpath, '//*[@id="order-search-header"]/span/div/button/i'

    def with (orderId)
        self.search_Field.set orderId
        self.search_button.click
    end

    def with_header (orderId)
        self.search_header_field.set orderId
        self.search_header_button.click
  end
end
