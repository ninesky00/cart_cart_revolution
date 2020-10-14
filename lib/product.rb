class Product
    attr_reader :category, :name, :unit_price, :quantity
    def initialize(category, name, unit_price, quantity)
        @category = category
        @name = name
        @unit_price = unit_price.to_f
        @quantity = quantity.to_f
        @hoarded = false 
    end

    def total_price
        @unit_price * @quantity
    end

    def hoard
        @hoarded = true
    end

    def is_hoarded?
        @hoarded
    end
end