Product.transaction do
  (1..10).each do |i|
    Product.create(title: "Product #{i}", 
                    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    price: 99.99)
  end
end