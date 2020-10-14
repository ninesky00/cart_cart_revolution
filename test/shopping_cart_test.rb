require 'minitest/autorun'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCartTest < Minitest::Test
    def setup
        @cart = ShoppingCart.new("King Soopers", "30items")
        @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        @product2 = Product.new(:meat, 'chicken', 4.50, '2')
    end

    def test_has_initialized_attributes
        assert_equal "King Soopers", @cart.name
        assert_equal 30, @cart.capacity
        assert_equal [], @cart.products 
    end

    def test_can_add_products_to_shopping_cart
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        expected = [@product1, @product2]
        assert_equal expected, @cart.products        
    end

    def test_can_view_cart_details
        expected = {name: "King Soopers", capacity: 30}
        assert_equal expected, @cart.details
    end
end

