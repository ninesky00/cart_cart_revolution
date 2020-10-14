class ShoppingCart
    attr_reader :name, :capacity, :products
    def initialize(name, capacity)
        @name = name
        @capacity = capacity.to_i
        @products = []
        @full = false
    end

    def add_product(product)
        @products << product
    end

    def details
        cart_hash = {name: @name, capacity: @capacity}
    end

    def total_number_of_products
        @products.inject(0) {|sum, product| sum += product.quantity}
    end

    def is_full?
        if total_number_of_products > 30
            @full = true
        end
        @full
    end

    def products_by_category(category)
        @products.select {|product| product.category == category}
    end
end