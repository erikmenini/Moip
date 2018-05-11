class SearchMoip < SitePrism::Page

    element :pedidos_button, '#tour-pedidos'
    element :search_Field, 'input[placeholder=\'Buscar por pedido ou comprador\']'
    element :search_button, '.btn-moip-blue.btn-search.top'
    element :search_header_field, '.m-wrap'
    element :search_header_button,'.fa.fa-search'

    def with (orderId)
        self.search_Field.set orderId
        self.search_button.click
    end

    def with_header (orderId)
        self.search_header_field.set orderId
        self.search_header_button.click
  end
end
