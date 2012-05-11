module Tuxedo
  def generate_cane_output
    "Methods exceeded maximum allowed ABC complexity (1):

  app/controllers/orders_controller.rb         OrdersController > create        23

    Lines violated style requirements (2):

  app/controllers/carts_controller.rb:4                 Line contains trailing whitespaces
  app/controllers/products_controller.rb:47             Line is >80 characters (89)"
  end

  def generate_full_cane_output
    "Lines violated style requirements (16):

  app/controllers/carts_controller.rb:4                 Line contains trailing whitespaces
  app/controllers/products_controller.rb:47             Line is >80 characters (89)
  app/controllers/products_controller.rb:48             Line is >80 characters (83)
  app/controllers/products_controller.rb:51             Line is >80 characters (83)
  app/controllers/products_controller.rb:63             Line is >80 characters (89)
  app/controllers/products_controller.rb:67             Line is >80 characters (83)
  spec/acceptance/public_user_views_products_spec.rb:9  Line contains trailing whitespaces
  spec/controllers/products_controller_spec.rb:29       Line contains trailing whitespaces
  spec/controllers/products_controller_spec.rb:113      Line is >80 characters (91)
  spec/controllers/products_controller_spec.rb:114      Line is >80 characters (96)
  spec/controllers/products_controller_spec.rb:119      Line is >80 characters (91)
  spec/controllers/products_controller_spec.rb:125      Line is >80 characters (91)
  spec/requests/products_spec.rb:6                      Line is >80 characters (97)
  spec/spec_helper.rb:12                                Line contains trailing whitespaces
  spec/support/example_data/products.rb:13              Line is >80 characters (126)
  spec/support/example_data/projects.rb:12              Line is >80 characters (128)

Classes are not documented (6):

  app/controllers/application_controller.rb:1  ApplicationController
  app/controllers/carts_controller.rb:1        CartsController
  app/controllers/products_controller.rb:1     ProductsController
  app/models/cart.rb:1                         Cart
  app/models/cart_item.rb:1                    CartItem
  app/models/product.rb:1                      Product"
  end
end
