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

    def percentage_occupied
        (total_number_of_products.to_f * 100 / @capacity).round(2)
    end

    def sorted_products_by_quantity
        low_to_high = @products.sort_by! {|product| product.quantity}
        high_to_low = low_to_high.reverse
    end

    def product_breakdown
        @products.sort_by! {|product| product.category}
        @products.group_by {|product| product.category}
    end
end