require 'minitest/autorun'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCartTest < Minitest::Test
    def setup
        @cart = ShoppingCart.new("King Soopers", "30items")
        @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        @product2 = Product.new(:meat, 'chicken', 4.50, '2')
        @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
        @product4 = Product.new(:produce, 'apples', 0.99, '20')
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

    def test_can_check_total_number_in_cart
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        @cart.add_product(@product3)
        assert_equal 13, @cart.total_number_of_products
    end

    def test_cart_is_full
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        @cart.add_product(@product3)
        assert_equal false, @cart.is_full?
        @cart.add_product(@product4)
        assert_equal true, @cart.is_full?
    end

    def test_select_products_by_category
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        @cart.add_product(@product3)
        @cart.add_product(@product4)
        expected = [@product1, @product3]
        assert_equal expected, @cart.products_by_category(:paper)
    end
end

